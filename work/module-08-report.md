# Module 08 Completion Report

## Tracked Files
project_spec.md

## Spec Commit History
a73b7cb (HEAD -> main) Add project specification

## project_spec.md Contents
# Frontier Replatforming Tracking Automation

## 1. Overview

This specification defines a lightweight automation and dashboard for managing the Frontier Replatforming project. The tool is designed for a program/project manager coordinating a cross-functional team of approximately 6–8 people across cloud/platform replatforming and migration work.

The system will centralize:
- Work Breakdown Structure (WBS) progress tracking
- Roadmap and milestone management
- Resource allocation and capacity planning
- Dependency tracking and critical path visibility
- Risk and issue management
- Team follow-ups and action tracking
- Executive-friendly status reporting

The solution is intentionally scoped for a pragmatic first release: a shared PM workspace with role-based access, spreadsheet-compatible imports, and actionable dashboards for weekly status management.

## 2. Interview Summary and Requirements

The following requirements were confirmed during the interview:
- Primary audience: program manager and team leads
- Primary goal: operational visibility across WBS, milestones, risks, dependencies, and actions
- Data sources: Excel/CSV-based manual inputs are the preferred starting point
- Team size: six to eight contributors across multiple workstreams
- Usage model: shared team workspace with PM-owned updates and role-based access
- Core outcome: enable faster decision-making, proactive risk handling, and follow-up accountability

## 3. Objectives

### 3.1 Business Objectives
- Maintain a single source of truth for replatforming progress and status
- Track and communicate milestone health across workstreams
- Balance resource demand and capacity across a small cross-functional team
- Highlight dependency blockers and schedule risks early
- Ensure that team action items and follow-ups are visible and tracked to completion

### 3.2 User Objectives
- PM: see project health, blockers, and decision items at a glance
- Team leads: validate progress, owner accountability, and resource load
- Stakeholders/executives: access high-level status and milestone risk summaries

## 4. Scope

### 4.1 In Scope
- WBS hierarchy and progress tracking
- Milestone and roadmap management
- Resource plan by person, role, and workstream
- Dependency tracking across tasks and milestones
- Risk and issue register with mitigation ownership
- Action items and follow-up tracker
- Dashboard views and exportable status snapshots
- CSV/XLSX import capability for manual reporting workflows

### 4.2 Out of Scope for Initial Release
- Deep integration with Jira/Azure DevOps/Planner as a first step
- Advanced portfolio forecasting and Monte Carlo analysis
- Workflow automation across teams outside the project management layer
- Full enterprise BI or custom data warehouse implementation

## 5. Users and Roles

### 5.1 Program Manager
- Maintains the overall plan, milestones, dependencies, and risk register
- Reviews project health and drives escalation decisions
- Owns weekly status preparation

### 5.2 Team Leads
- Own workstream progress and owner accountability
- Update delivery status, blockers, and resourcing needs
- Confirm dependencies and follow-up actions

### 5.3 Contributors
- Update task status and completion estimates
- Log blockers/risks relevant to their workstreams
- Resolve assigned follow-ups

### 5.4 Executive/Stakeholder Viewers
- View high-level milestones, status, risks, and key decisions
- Access summary dashboards without editing permissions

## 6. Core Functional Requirements

### 6.1 WBS Progress Tracking
The system must support a hierarchical work breakdown structure representing workstreams, deliverables, and tasks.

Required fields:
- WBS ID
- Parent WBS ID
- Workstream name
- Deliverable or task name
- Owner
- Status
- Planned start date
- Planned end date
- Actual start date
- Actual end date
- % complete
- Progress notes
- Dependency IDs
- Risk flags

Status values:
- Not started
- In progress
- At risk
- Blocked
- Complete
- Deferred

Required capabilities:
- Add/edit/delete WBS items
- Roll-up completion by workstream and project level
- Filter by owner, status, milestone, and dependency state
- Display overdue or at-risk items clearly

### 6.2 Roadmap and Milestones
The system must provide roadmap visibility around major delivery milestones.

Required fields:
- Milestone ID
- Milestone name
- Workstream or dependency group
- Target date
- Baseline date
- Actual/forecast completion date
- Status
- Owner
- Success criteria
- Notes

Required capabilities:
- Track milestone health: on track / at risk / delayed
- Link milestones to owning workstream or task package
- Display roadmap timeline by month or quarter
- Show milestone variance to plan

### 6.3 Resource Allocation and Capacity Planning
The solution must make workload visible across the team and highlight over-allocation.

Required fields:
- Person or role
- Workstream
- Planned effort (FTE or percentage)
- Planned allocation period
- Actual effort / usage
- Capacity
- Availability constraints
- Allocation notes

Required capabilities:
- Display per-person allocation by workstream
- Highlight capacity gaps or overload
- Support planned vs actual versus capacity comparison
- Allow PM to adjust assignment and surface impacts

### 6.4 Dependency Tracking
Dependencies must be explicit and visible to avoid hidden delays.

Required fields:
- Dependency ID
- Source item
- Target item
- Dependency type
- Dependency status
- Dependency owner
- Due date
- Risk impact
- Blocker notes

Required capabilities:
- Link tasks or milestones to upstream/downstream dependencies
- Mark dependency as blocked, at risk, or resolved
- Identify chains that threaten critical path or milestone dates
- Sort by urgency and impact

### 6.5 Risk and Issue Register
The tool must support integrated risk management for migration activities.

Required fields:
- Risk ID
- Risk description
- Category
- Workstream
- Owner
- Likelihood
- Impact
- Risk score
- Mitigation plan
- Trigger / early warning
- Status
- Due date
- Escalation level

Required capabilities:
- Track open/closed risks and issues
- Filter by severity, workstream, and owner
- Support mitigation tracking and escalation workflow
- Surface risks affecting milestone dates or critical dependencies

### 6.6 Action Items and Team Follow-Ups
The system must support accountability for decisions and tasks.

Required fields:
- Action ID
- Action description
- Owner
- Related workstream or milestone
- Due date
- Status
- Priority
- Notes
- Escalation flag

Required capabilities:
- Track overdue follow-ups
- Assign follow-up owners and due dates
- Mark resolved or carried forward
- Show action summary for weekly reviews

### 6.7 Dashboards and Reporting
The dashboard is the primary user experience and should consolidate the project’s health into one place.

Required dashboard views:
- Executive summary
- Workstream progress dashboard
- Milestone health dashboard
- Dependency and blocker view
- Resource utilization overview
- Risk register summary
- Open action items report

Required reporting features:
- Weekly status snapshot export
- CSV export for the PM workbook and stakeholder updates
- Simple trend view for progress over time
- Status filter by date range, workstream, owner, or status

## 7. Data Model

### 7.1 Core Entities
The minimum data model includes:
- Project
- Workstream
- WBS item
- Milestone
- Resource allocation
- Dependency
- Risk
- Action item
- User / team role

### 7.2 Example Relationship Model
- Project has many workstreams
- Workstreams contain WBS items
- WBS items may have owners and dependencies
- Milestones are linked to workstreams or multiple WBS items
- Risks and actions are linked to workstreams, milestones, or owners
- Resources are assigned across workstreams and time periods

## 8. Functional Workflow

### 8.1 Weekly Status Cycle
1. Team leads update task status and blockers
2. PM validates milestone and dependency status
3. Risks and actions are reviewed and escalated if necessary
4. Resource utilization is checked against team capacity
5. Dashboard is refreshed and exported for stakeholder review

### 8.2 Risk Escalation Workflow
- Risk is created or updated
- Severity and trigger conditions are assessed
- PM reviews and assigns escalation owner
- Mitigation actions are logged
- Risk is re-scored as needed until closure

### 8.3 Dependency Resolution Workflow
- Dependency identified with source and target
- Owner confirmed and due date assigned
- PM monitors blocker impact to milestone schedule
- Dependency status escalated when delayed or unresolved

## 9. Proposed Solution Architecture

### 9.1 Recommended Implementation Model
Given the team size and requirements, the preferred approach is a lightweight web-based project tracking application with spreadsheet import/export support.

Recommended stack:
- Frontend: React or similar lightweight UI framework
- Backend: Node.js or Python API services
- Database: PostgreSQL (preferred) or SQLite for early prototypes
- Import format: CSV/XLSX upload
- Authentication: simple role-based access control; Azure AD integration is optional for later phases
- Reporting: built-in dashboard views plus CSV export

### 9.2 Architecture Principles
- Centralize project data with a single source of truth
- Make it easy to update from workbooks and manual PM tracking
- Keep the interface simple and fast for a 6–8 person team
- Prioritize clarity over complexity
- Support lightweight reporting without requiring enterprise BI tooling

## 10. Non-Functional Requirements

### 10.1 Security and Access
- Role-based permissions for PM, team leads, contributors, and viewers
- Only authorized users can edit project records
- Audit log for key changes to milestones, risks, dependencies, and actions
- Secure login and environment configuration

### 10.2 Availability and Performance
- Dashboard should load quickly for a small dataset
- Updates should reflect in near real time for the team
- System should remain usable during shared updates and weekly reviews

### 10.3 Reliability
- Data should be backed up and recoverable
- CSV/XLSX imports must validate formatting before saving
- Application should handle incomplete or partial updates without data loss

### 10.4 Usability
- UI must be straightforward enough for non-technical PM and team leads
- Tables and status filters must be highly readable
- Support browser-based access with responsive layout

## 11. Data Quality and Governance Rules

- Every WBS item must have an owner and status
- Every milestone must have a target date and owner
- Every risk must include severity, owner, and mitigation plan
- Every action item must have an assignee and due date
- Dependency records cannot be left without a source or target
- Closed items must retain history for reporting and audit traceability

## 12. Success Metrics

The solution will be considered successful if it enables:
- Weekly PM reviews to be prepared in less than 30 minutes
- Dependencies and blockers to be visible before they impact milestone dates
- Risks to move from identification to mitigation within a defined review cycle
- Resource overload to be visible before the team is overcommitted
- Action items to be tracked to closure instead of being lost in email or chat

## 13. Acceptance Criteria

### Must Have
- Users can create and manage WBS items with status and ownership
- Users can create and track milestones, risks, dependencies, and action items
- Dashboard shows project health across workstreams and milestones
- Resource allocation view highlights over-allocation or underutilization
- CSV/XLSX import supports common project tracking workflows
- PM has the ability to export status snapshots

### Should Have
- Role-based access and permissions
- Dependency and milestone impact highlighting
- Filters for workstream, owner, milestone, and date range
- Audit trail for edits to key records

### Nice to Have for Later Phases
- Jira/Azure DevOps integration
- Automated reminders for overdue actions
- Alerting on risk threshold exceedance
- Historical trend reporting over time

## 14. Risks and Constraints

### Risks
- Team updates may be inconsistent if data entry is not disciplined
- Manual spreadsheets can become stale if users do not update them regularly
- Dependency ownership may be unclear without PM governance

### Constraints
- Small project team with limited operational overhead
- Need for speed in implementation and adoption
- Use of manual workbook workflows as the starting model

## 15. Recommended First Delivery Plan

### Phase 1: MVP
- Shared dashboard for project status
- WBS tracking and status rollups
- Milestone tracking
- Risk register
- Action items and follow-ups
- CSV/XLSX import/export
- Role-based viewer/editor permissions

### Phase 2: Enhanced Operations
- Resource capacity analytics
- Dependency heatmap and critical path view
- Risk scoring and trend tracking
- Automated weekly report generation

### Phase 3: Enterprise Integration
- Jira/Azure DevOps ingestion
- Stakeholder portals and scheduled reports
- Deep audit and governance controls

## 16. Final Recommendation

The best initial approach is a lightweight, shared PM tracker built as a small web application with spreadsheet-friendly inputs and role-based access. This matches the project’s scale, team structure, and reporting needs without introducing unnecessary complexity. It gives the PM a single place to manage WBS progress, milestones, risks, dependencies, team follow-ups, and resource constraints while enabling cross-functional visibility in a practical and maintainable way.
