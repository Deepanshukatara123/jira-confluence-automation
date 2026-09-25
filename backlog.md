# Frontier Replatforming Tracking Automation Backlog

**Scope:** MVP-first shared PM workspace for a 6-8 person replatforming team.
**Working assumptions:** React frontend, Node.js or Python API, PostgreSQL (SQLite acceptable for an early prototype), CSV/XLSX import, built-in dashboards and CSV export, and basic role-based access control.

## MCP and Skill Strategy

- Evaluated the Atlassian Jira/Confluence MCP server ecosystem as the standard integration option for searching, creating, updating, and commenting on Jira issues and Confluence pages.
- No current MVP task requires Jira or Confluence access; the product's internal data, workflows, UI, validation, and reporting remain project-specific and use custom skills.
- The deferred external-integration task is marked `MCP` because a standard Atlassian MCP server can provide the connector surface when that work is brought into scope.
- Every backlog task below is labeled `MCP` or `custom skill` at the end of its checklist item.

## Phase 1: Setup

- [ ] Create the application repository structure for the frontend, API, database layer, shared types, and documentation. — custom skill
- [ ] Configure the frontend framework, API runtime, local development scripts, linting, formatting, and environment variables. — custom skill
- [ ] Provision the development database and add migrations for Project, Workstream, WBS Item, Milestone, Resource Allocation, Dependency, Risk, Action Item, User, and Team Role entities. — custom skill
- [ ] Define shared enums and validation schemas for statuses, priorities, likelihood, impact, escalation levels, dependency types, and role permissions. — custom skill
- [ ] Seed one sample Frontier Replatforming project with 6-8 users, workstreams, milestones, and representative tracking data. — custom skill
- [ ] Document local setup, environment configuration, database initialization, and sample login instructions. — custom skill

## Phase 2: Core Features

### Access and Workspace

- [ ] Implement sign-in and role-based access for Program Manager, Team Lead, Contributor, and Executive/Stakeholder Viewer roles. — custom skill
- [ ] Enforce permissions so PMs manage the overall plan, team leads update workstreams, contributors update assigned work, and viewers have read-only summary access. — custom skill
- [ ] Build the shared project workspace shell with navigation for dashboard, WBS, roadmap, resources, dependencies, risks, actions, imports, and exports. — custom skill

### WBS Progress Tracking

- [ ] Build hierarchical WBS CRUD for workstreams, deliverables, and tasks. — custom skill
- [ ] Support WBS ID, parent WBS ID, workstream, name, owner, status, planned/actual dates, percent complete, notes, dependency IDs, and risk flags. — custom skill
- [ ] Implement project and workstream completion roll-ups. — custom skill
- [ ] Add filters for owner, status, milestone, and dependency state. — custom skill
- [ ] Highlight overdue, at-risk, blocked, and deferred items. — custom skill

### Roadmap and Milestones

- [ ] Build milestone CRUD with milestone ID, name, workstream/dependency group, target, baseline, actual/forecast date, status, owner, success criteria, and notes. — custom skill
- [ ] Link milestones to workstreams and WBS task packages. — custom skill
- [ ] Add monthly and quarterly roadmap timeline views. — custom skill
- [ ] Calculate and display milestone variance to baseline. — custom skill
- [ ] Display milestone health as on track, at risk, or delayed. — custom skill

### Resource Allocation and Capacity

- [ ] Build resource allocation management by person or role, workstream, period, planned effort, actual effort, capacity, availability constraints, and notes. — custom skill
- [ ] Display each person's allocation by workstream. — custom skill
- [ ] Compare planned effort, actual usage, and capacity. — custom skill
- [ ] Highlight capacity gaps and over-allocation. — custom skill
- [ ] Allow PMs to adjust assignments and show affected workstreams or milestones. — custom skill

### Dependencies

- [ ] Build dependency CRUD for source item, target item, type, status, owner, due date, risk impact, and blocker notes. — custom skill
- [ ] Link dependencies to WBS items and milestones in both directions. — custom skill
- [ ] Support blocked, at-risk, and resolved states. — custom skill
- [ ] Identify dependency chains that threaten the critical path or milestone dates. — custom skill
- [ ] Sort dependency views by urgency and impact. — custom skill

### Risks and Issues

- [ ] Build the risk and issue register with ID, description, category, workstream, owner, likelihood, impact, score, mitigation, trigger, status, due date, and escalation level. — custom skill
- [ ] Calculate risk score consistently from likelihood and impact. — custom skill
- [ ] Support open and closed states, severity/workstream/owner filters, mitigation tracking, and escalation ownership. — custom skill
- [ ] Surface risks affecting milestone dates or critical dependencies. — custom skill
- [ ] Support re-scoring through the risk lifecycle until closure. — custom skill

### Actions and Follow-ups

- [ ] Build action item CRUD with ID, description, owner, related workstream/milestone, due date, status, priority, notes, and escalation flag. — custom skill
- [ ] Show overdue and upcoming follow-ups. — custom skill
- [ ] Support resolved and carried-forward states. — custom skill
- [ ] Provide an action summary for weekly reviews. — custom skill

### Dashboards and Reporting

- [ ] Build an executive summary with project health, milestone risk, major blockers, open risks, decisions, and overdue actions. — custom skill
- [ ] Build workstream progress, milestone health, dependency/blocker, resource utilization, risk summary, and open action dashboards. — custom skill
- [ ] Add date range, workstream, owner, and status filters across dashboard views. — custom skill
- [ ] Add a simple progress trend over time. — custom skill
- [ ] Generate a weekly status snapshot for stakeholder review. — custom skill
- [ ] Export PM workbook and stakeholder-ready data as CSV. — custom skill

## Phase 3: Integration

- [ ] Build CSV import with column mapping, required-field validation, preview, error reporting, and partial-load protection. — custom skill
- [ ] Build XLSX import using the same validation and preview workflow. — custom skill
- [ ] Support imports for WBS items, milestones, resources, dependencies, risks, and actions. — custom skill
- [ ] Add duplicate detection, update-vs-create rules, import history, and rollback handling. — custom skill
- [ ] Add CSV export for each core entity and a combined PM reporting export. — custom skill
- [ ] Implement the weekly status cycle: team updates, PM validation, risk/action review, capacity check, dashboard refresh, and snapshot export. — custom skill
- [ ] Implement risk escalation workflow from creation through scoring, owner assignment, mitigation, escalation, re-scoring, and closure. — custom skill
- [ ] Implement dependency resolution workflow from identification through ownership, due-date monitoring, escalation, and resolution. — custom skill
- [ ] Keep external Jira, Azure DevOps, and Planner integrations out of the first release while documenting future extension points. — MCP

## Phase 4: Testing

- [ ] Add unit tests for validation schemas, status transitions, roll-ups, risk scoring, milestone variance, capacity calculations, and critical-path impact detection. — custom skill
- [ ] Add API integration tests for CRUD, permissions, imports, exports, filters, and workflow transitions. — custom skill
- [ ] Add frontend tests for WBS editing, dashboard filters, timeline views, resource overload indicators, risk/action updates, and read-only viewer behavior. — custom skill
- [ ] Add end-to-end coverage for the weekly status cycle, risk escalation, and dependency resolution workflows. — custom skill
- [ ] Test CSV/XLSX imports with valid data, missing required fields, invalid dates, duplicate records, and conflicting updates. — custom skill
- [ ] Test role-based access for all four user roles, including unauthorized read and write attempts. — custom skill
- [ ] Test responsive usability and accessibility for the PM workspace and executive summary. — custom skill
- [ ] Verify export contents against the source records and dashboard filters. — custom skill
- [ ] Add a release checklist covering backup, migration, seed data, error monitoring, and rollback. — custom skill

## Phase 5: Documentation

- [ ] Document the product scope, MVP boundaries, and explicitly out-of-scope capabilities. — custom skill
- [ ] Document the data model and relationships between projects, workstreams, WBS items, milestones, resources, dependencies, risks, actions, users, and roles. — custom skill
- [ ] Document field definitions, status meanings, scoring rules, and ownership expectations. — custom skill
- [ ] Write role-specific guides for PMs, team leads, contributors, and executive viewers. — custom skill
- [ ] Write the weekly status cycle, risk escalation, and dependency resolution procedures. — custom skill
- [ ] Document CSV/XLSX templates, import mapping, validation errors, and export formats. — custom skill
- [ ] Document dashboard interpretation, filters, trend behavior, and weekly snapshot use. — custom skill
- [ ] Document API endpoints, authentication assumptions, migrations, backup/restore, and future integration extension points. — custom skill
- [ ] Record known limitations, deferred enterprise integrations, and the roadmap for post-MVP forecasting or BI capabilities. — custom skill

## Definition of Done

- [ ] A PM can maintain WBS, milestones, resources, dependencies, risks, and actions in one workspace. — custom skill
- [ ] Team leads and contributors can update assigned work while executive viewers remain read-only. — custom skill
- [ ] Dashboards surface health, blockers, capacity issues, risks, milestones, and overdue actions. — custom skill
- [ ] A PM can import spreadsheet data, validate it, and export a weekly status snapshot. — custom skill
- [ ] Weekly status, risk escalation, and dependency resolution workflows are test-covered and documented. — custom skill
- [ ] The MVP is runnable locally with sample data and setup instructions. — custom skill
