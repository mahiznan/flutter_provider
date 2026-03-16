
# Centralized Secret Management via EnaaS

Standardized Secret Governance for Client Connect & Core Services

Presenter: Rajeshkumar Muthaiah

Objective:
Establish EnaaS as the centralized platform for secret management with standardized naming,
automated synchronization to OCP, and rollback-safe deployments.

---

## Slide 1 – Title
Centralized Secret Management via EnaaS  
Standardized Secret Governance for Client Connect & Core Services

---

## Slide 2 – Current State (Primary Problem)
Secrets are currently created directly in OCP and duplicated across services.

Problems:
- Secrets duplicated across multiple services
- No centralized governance
- Difficult lifecycle management
- High maintenance overhead

---

## Slide 3 – Additional Challenges
- No standard naming conventions
- Secrets mixed with configuration values
- Difficult secret rotation
- Limited audit visibility
- Rollback challenges

Impact:
- Security risk
- Deployment instability
- Operational complexity

---

## Slide 4 – Objective
Centralize secret management using EnaaS.

Goals:
- EnaaS as single source of truth
- Standard naming conventions
- Automated sync to OCP
- Versioned secrets
- Backward compatibility
- Support AIMW and non‑AIMW secrets

---

## Slide 5 – Target Architecture

EnaaS  
↓  
service-sync-EnaaS-creds  
↓  
OCP Versioned Secrets  
↓  
Client Connect & Core Services

---

## Slide 6 – Secret Sync Mechanism

Common service implemented:

service-sync-EnaaS-creds

Responsibilities:
- Sync secrets from EnaaS to OCP
- Apply naming conventions
- Maintain secret versions
- Provide consistent secrets across services

---

## Slide 7 – EnaaS Naming Convention

Service Secret:
{app-code}-{env}-{service-name}

Example:
payment-prod-order-service

Common Secret:
{app-code}-{env}-{common-name}

Example:
payment-prod-database

---

## Slide 8 – OCP Naming Convention

Format:
{app-code}-{env}-{service-name}-{version}

Examples:
payment-prod-order-service-v1
payment-prod-order-service-v2

---

## Slide 9 – Versioning Strategy

Secret Update Flow:

EnaaS update → Sync service → New version in OCP → Application uses latest version

Rollback:
Older deployment automatically uses corresponding secret version.

---

## Slide 10 – Version Retention Policy

Policy:
- Maintain last 10 secret versions
- Older versions cleaned automatically

Benefits:
- Rollback safety
- Prevent secret sprawl

---

## Slide 11 – Secret vs Configuration Separation

Not secrets:
- IDs
- Usernames
- Public keys
- Non‑sensitive identifiers

Move these to application configuration.

---

## Slide 12 – Policy for New Secrets

All new secrets must:
1. Be created in EnaaS
2. Be synced automatically to OCP
3. Follow naming conventions

---

## Slide 13 – Migration Strategy

Existing services migrate gradually.

Principles:
- No disruption
- Backward compatibility
- Incremental migration

---

## Slide 14 – Secret Binding Strategy

Existing secret bindings remain.

New EnaaS secrets added as additional bindings.

Application config updated to use the new secret key to avoid conflicts.

---

## Slide 15 – Migration Flow

Current:
OCP secrets duplicated across services

Migration:
Existing secret + new EnaaS secret

Final:
Application uses EnaaS-managed secret

---

## Slide 16 – Benefits

Security:
- Centralized governance
- Reduced duplication
- Better auditing

Operational:
- Standard naming
- Easier lifecycle management

Deployment:
- Versioned rollback-safe secrets

---

## Slide 17 – Adoption Plan

Phase 1 – Standards definition  
Phase 2 – Adoption for new services  
Phase 3 – Migration of existing services  
Phase 4 – Governance enforcement

---

## Slide 18 – Before vs After Architecture

Before:
Secrets stored directly in OCP and duplicated across services.

After:
EnaaS → Sync Service → OCP Versioned Secrets → Applications

---

## Slide 19 – Secret Lifecycle

Secret Creation → EnaaS → Sync Service → OCP → Application Deployment

---

## Slide 20 – Rollback Safety

Secret versions maintained in OCP.

Example:
v1  
v2  
v3  
v4 (latest)

Rollback deployment automatically uses previous version.


