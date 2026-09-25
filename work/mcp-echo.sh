#!/usr/bin/env bash

set -u

json_escape() {
  local value=$1
  value=${value//\\/\\\\}
  value=${value//\"/\\\"}
  value=${value//$'\n'/\\n}
  value=${value//$'\r'/\\r}
  value=${value//$'\t'/\\t}
  printf '%s' "$value"
}

json_string_value() {
  local key=$1
  local json=$2
  if [[ $json =~ \"$key\"[[:space:]]*:[[:space:]]*\"(([^\"\\]|\\.)*)\" ]]; then
    printf '%s' "${BASH_REMATCH[1]}"
  fi
}

json_number_value() {
  local key=$1
  local json=$2
  if [[ $json =~ \"$key\"[[:space:]]*:[[:space:]]*(-?[0-9]+([.][0-9]+)?) ]]; then
    printf '%s' "${BASH_REMATCH[1]}"
  fi
}

send_result() {
  printf '{"jsonrpc":"2.0","id":%s,"result":%s}\n' "$1" "$2"
}

send_error() {
  printf '{"jsonrpc":"2.0","id":%s,"error":{"code":%s,"message":"%s"}}\n' \
    "$1" "$2" "$(json_escape "$3")"
}

while IFS= read -r request; do
  [[ -z $request ]] && continue

  id='null'
  if [[ $request =~ \"id\"[[:space:]]*:[[:space:]]*([^,}]+) ]]; then
    id=${BASH_REMATCH[1]}
  fi

  method=''
  if [[ $request =~ \"method\"[[:space:]]*:[[:space:]]*\"([^\"]+)\" ]]; then
    method=${BASH_REMATCH[1]}
  fi

  case $method in
    initialize)
      send_result "$id" '{"protocolVersion":"2024-11-05","capabilities":{"tools":{}},"serverInfo":{"name":"echo-server","version":"1.0.0"}}'
      ;;
    notifications/initialized)
      ;;
    tools/list)
      send_result "$id" '{"tools":[{"name":"echo","description":"Return the supplied text.","inputSchema":{"type":"object","properties":{"text":{"type":"string"}},"required":["text"]}},{"name":"get_time","description":"Return the current timestamp.","inputSchema":{"type":"object","properties":{},"additionalProperties":false}},{"name":"calculate","description":"Perform arithmetic on two numbers.","inputSchema":{"type":"object","properties":{"operation":{"type":"string","enum":["add","subtract","multiply","divide"]},"a":{"type":"number"},"b":{"type":"number"}},"required":["operation","a","b"]}}]}'
      ;;
    tools/call)
      tool=$(json_string_value name "$request")
      case $tool in
        echo)
          text=$(json_string_value text "$request")
          send_result "$id" "{\"content\":[{\"type\":\"text\",\"text\":\"Echo: $(json_escape "${text:-}")\"}]}"
          ;;
        get_time)
          timestamp=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
          send_result "$id" "{\"content\":[{\"type\":\"text\",\"text\":\"$timestamp\"}]}"
          ;;
        calculate)
          operation=$(json_string_value operation "$request")
          a=$(json_number_value a "$request")
          b=$(json_number_value b "$request")
          case $operation in
            add) result=$((a + b)) ;;
            subtract) result=$((a - b)) ;;
            multiply) result=$((a * b)) ;;
            divide)
              if [[ ${b:-0} == 0 ]]; then
                send_error "$id" -32602 'Cannot divide by zero.'
                continue
              fi
              result=$((a / b))
              ;;
            *)
              send_error "$id" -32602 'operation must be add, subtract, multiply, or divide.'
              continue
              ;;
          esac
          send_result "$id" "{\"content\":[{\"type\":\"text\",\"text\":\"$result\"}]}"
          ;;
        *)
          send_error "$id" -32602 'Unknown tool.'
          ;;
      esac
      ;;
    *)
      [[ $id == null ]] || send_error "$id" -32601 "Method not found: $method"
      ;;
  esac
done