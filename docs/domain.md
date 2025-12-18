# ORR Domain Model

## Core Concepts

### Pillars

Fundamental categories that organize assessment questions. Each pillar represents a key operational area *e.g., Reliability, Security, Performance*.

### Questions

Specific points of evaluation within each pillar. Questions in a nutshell:

- Relates to a pillar and maybe category
- Contains Yes/No OR Practices checklist
- Contains metadata on why, practices, and resources
- Can be disabled
- Can be ordered differently within a pillar
- Contains reason why they exist (why important)
- Contains leading practices (practices typically followed)
- Contains helpful links (internal or external links)
- For Yes/No questions, it contains potential risk level
- For Practices checklist questions, it contains potential risk level and weight per practice

### Assessments

A collection of answers to questions, representing a point-in-time evaluation of operational readiness.

### Templates

Predefined sets of questions that can be used to create new assessments. Templates ensure consistency across similar types of evaluations.

### Readiness

A policy-based outcome of an assessment, not a simple test result. Determines if a system is ready for production deployment based on the assessment results.

## Assessment Statuses

Statuses are derived from the assessment state, not directly user-editable:

| Status               | Description                                            |
|----------------------|--------------------------------------------------------|
| **DRAFT**            | Incomplete assessment, not yet evaluable               |
| **IN_REVIEW**        | All answers are present but not yet evaluated          |
| **READY**            | System is deployable with no critical issues           |
| **READY_WITH_RISKS** | Deployable but with acknowledged risks                 |
| **NOT_READY**        | Explicitly blocked from release due to critical issues |

### Release Policy

Only assessments in these statuses should allow release, depending on organizational policy:
- `READY`
- `READY_WITH_RISKS` (with appropriate approvals)

## Domain Evolution

This document will evolve as the domain model matures. Significant changes should be documented in the [Decision Log](../docs/decisions/).
