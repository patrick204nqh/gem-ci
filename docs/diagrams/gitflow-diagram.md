# GitFlow Workflow Diagram

Visual representation of the GitFlow branching model used in gem-ci projects.

## Branch Flow Diagram

```mermaid
gitGraph
    commit id: "Initial"
    
    branch develop
    checkout develop
    commit id: "Setup dev"
    
    branch feature/auth
    checkout feature/auth
    commit id: "Add login"
    commit id: "Add tests"
    
    checkout develop
    merge feature/auth
    commit id: "Merge auth"
    
    branch feature/api
    checkout feature/api
    commit id: "Add API"
    commit id: "API tests"
    
    checkout develop
    merge feature/api
    commit id: "Merge API"
    
    branch release/v1.0.0
    checkout release/v1.0.0
    commit id: "Version bump"
    commit id: "Update docs"
    
    checkout main
    merge release/v1.0.0
    commit id: "Release v1.0.0"
    
    checkout develop
    merge release/v1.0.0
    
    checkout main
    branch hotfix/v1.0.1
    checkout hotfix/v1.0.1
    commit id: "Critical fix"
    
    checkout main
    merge hotfix/v1.0.1
    commit id: "Hotfix v1.0.1"
    
    checkout develop
    merge hotfix/v1.0.1
```

## Detailed GitFlow Process

```mermaid
flowchart TD
    A[Start Development] --> B{Feature or Fix?}
    
    B -->|New Feature| C[Create feature/* branch]
    B -->|Bug Fix| D[Create bugfix/* branch]
    B -->|Critical Fix| E[Create hotfix/* branch]
    
    C --> F[Develop Feature]
    D --> G[Fix Bug]
    E --> H[Apply Hotfix]
    
    F --> I[Create PR to develop]
    G --> J[Create PR to develop]
    H --> K[Create PR to master]
    
    I --> L{CI Passes?}
    J --> L
    K --> M{CI Passes?}
    
    L -->|No| N[Fix Issues]
    L -->|Yes| O[Merge to develop]
    M -->|No| P[Fix Issues]
    M -->|Yes| Q[Merge to master]
    
    N --> F
    P --> H
    
    O --> R[Integration Testing]
    Q --> S[Tag Release]
    Q --> T[Merge to develop]
    
    R --> U{Ready for Release?}
    U -->|No| V[Continue Development]
    U -->|Yes| W[Create release/* branch]
    
    V --> A
    W --> X[Prepare Release]
    X --> Y[Create PR to master]
    Y --> Z{Release CI Passes?}
    Z -->|No| AA[Fix Release Issues]
    Z -->|Yes| BB[Merge & Tag]
    
    AA --> X
    BB --> CC[Deploy to Production]
    BB --> DD[Merge back to develop]
    
    S --> EE[Hotfix Complete]
    CC --> FF[Release Complete]
    DD --> GG[Sync Complete]
    
    EE --> A
    FF --> A
    GG --> A
```

## CI/CD Integration

```mermaid
flowchart LR
    subgraph "Branch Types"
        A[feature/*]
        B[bugfix/*]
        C[develop]
        D[release/*]
        E[hotfix/*]
        F[master]
    end
    
    subgraph "CI Workflows"
        G[02-ci.yml<br/>Basic Tests]
        H[03-security.yml<br/>Security Scan]
        I[04-quality.yml<br/>Code Quality]
        J[06-release.yml<br/>Release Process]
    end
    
    subgraph "Checks Required"
        K[✅ Ruby 3.3 Tests]
        L[✅ RuboCop Linting]
        M[✅ Security Scan]
        N[✅ Code Coverage]
    end
    
    A --> G
    B --> G
    C --> G
    C --> H
    C --> I
    D --> G
    D --> H
    D --> I
    E --> G
    E --> H
    F --> J
    
    G --> K
    I --> L
    H --> M
    G --> N
```

## Branch Protection Rules

```mermaid
flowchart TD
    subgraph "master Branch"
        A[🔒 Delete Protection]
        B[🔒 Force Push Protection]
        C[✅ Ruby 3.3 CI Required]
        D[✅ Code Quality Required]
        E[✅ Security Scan Required]
        F[👥 PR Review Required]
        G[✍️ Signed Commits Required]
    end
    
    subgraph "develop Branch"
        H[✅ Ruby 3.3 CI Required]
        I[✅ Code Quality Required]
        J[👥 PR Review Optional]
    end
    
    subgraph "feature/* Branches"
        K[🔓 No Protection]
        L[✅ CI Tests on PR]
    end
    
    subgraph "release/* Branches"
        M[✅ Ruby 3.3 CI Required]
        N[✅ Full Quality Suite]
        O[👥 PR Review Required]
    end
```

## Release Automation Flow

```mermaid
sequenceDiagram
    participant Dev as Developer
    participant PR as Pull Request
    participant CI as CI/CD Pipeline
    participant RP as Release Please
    participant GH as GitHub Releases
    participant RG as RubyGems
    participant SL as Slack
    
    Dev->>PR: Create PR to master
    PR->>CI: Trigger CI workflows
    CI->>CI: Run tests, security, quality
    CI->>PR: ✅ All checks pass
    Dev->>PR: Merge to master
    
    PR->>RP: Trigger release-please
    RP->>RP: Analyze conventional commits
    RP->>GH: Create release PR (if needed)
    
    Dev->>GH: Merge release PR
    GH->>CI: Trigger release workflow
    CI->>GH: Create GitHub release
    CI->>RG: Publish to RubyGems
    CI->>SL: Send success notification
```

## Workflow Triggers Summary

| Branch Pattern | Workflow Triggered | Purpose |
|---------------|-------------------|---------|
| `feature/*` | CI on PR | Validate feature changes |
| `bugfix/*` | CI on PR | Validate bug fixes |
| `develop` | CI + Security + Quality | Integration validation |
| `release/*` | Full CI Suite | Pre-release validation |
| `hotfix/*` | CI + Security | Critical fix validation |
| `master` | Release Process | Production deployment |

This diagram shows how gem-ci integrates GitFlow with automated CI/CD for efficient Ruby gem development and deployment.