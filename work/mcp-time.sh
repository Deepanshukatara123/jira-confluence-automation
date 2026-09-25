#!/usr/bin/env bash

set -u

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
      printf '%s\n' "{\"jsonrpc\":\"2.0\",\"id\":$id,\"result\":{\"protocolVersion\":\"2024-11-05\",\"capabilities\":{\"tools\":{}},\"serverInfo\":{\"name\":\"time-server\",\"version\":\"1.0.0\"}}}"
      ;;
    notifications/initialized)
      ;;
    tools/list)
      printf '%s\n' "{\"jsonrpc\":\"2.0\",\"id\":$id,\"result\":{\"tools\":[{\"name\":\"get_time\",\"description\":\"Return the current UTC timestamp.\",\"inputSchema\":{\"type\":\"object\",\"properties\":{},\"additionalProperties\":false}}]}}"
      ;;
    tools/call)
      if [[ $request == *'"name":"get_time"'* ]]; then
        timestamp=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
        printf '%s\n' "{\"jsonrpc\":\"2.0\",\"id\":$id,\"result\":{\"content\":[{\"type\":\"text\",\"text\":\"$timestamp\"}]}}"
      else
        printf '%s\n' "{\"jsonrpc\":\"2.0\",\"id\":$id,\"error\":{\"code\":-32602,\"message\":\"Unknown tool.\"}}"
      fi
      ;;
    *)
      [[ $id == null ]] || printf '%s\n' "{\"jsonrpc\":\"2.0\",\"id\":$id,\"error\":{\"code\":-32601,\"message\":\"Method not found.\"}}"
      ;;
  esac
  done