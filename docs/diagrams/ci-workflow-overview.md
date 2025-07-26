# 🔄 Ruby Gem Repository Lifecycle

## Diagram 1: Repository Lifecycle & Tasks

```mermaid
graph TD
    subgraph "🚀 Phase 1: Repository Setup"
        A1[📁 Create Repository] 
        A2[⚙️ Configure Secrets & Settings]
        A3[🏷️ Setup Labels & Rules]
        A4[🛡️ Configure Branch Protection]
    end
    
    subgraph "💻 Phase 2: Development Cycle"
        B1[📝 Write Code & Tests]
        B2[📤 Push to Branch]
        B3[🧪 Run Tests & Checks]
        B4[🔧 Create Pull Request]
        B5[👋 Welcome Contributors]
        B6[🏷️ Auto-label Issues/PRs]
        B7[👥 Code Review Process]
        B8[🔀 Merge to Main]
    end
    
    subgraph "📦 Phase 3: Dependency Management"
        C1[📋 Check for Updates]
        C2[🔄 Create Update PRs]
        C3[🧪 Test Dependency Changes]
        C4[✅ Auto-merge Safe Updates]
    end
    
    subgraph "🚀 Phase 4: Release Process"
        D1[🏷️ Create Release Tag]
        D2[🏗️ Build Gem Package]
        D3[🧪 Test Built Gem]
        D4[💎 Publish to RubyGems]
        D5[📝 Generate Changelog]
        D6[📢 Send Notifications]
    end
    
    subgraph "🔄 Phase 5: Ongoing Maintenance"
        E1[🧹 Manage Stale Issues]
        E2[🌐 Check Ecosystem Health]
        E3[📈 Monitor Performance]
        E4[👥 Engage Community]
    end
    
    %% Phase flows
    A1 --> A2 --> A3 --> A4 --> B1
    B1 --> B2 --> B3 --> B4 --> B5
    B5 --> B6 --> B7 --> B8 --> B1
    
    C1 --> C2 --> C3 --> C4 --> C1
    
    B8 --> D1 --> D2 --> D3 --> D4 --> D5 --> D6 --> B1
    
    E1 --> E2 --> E3 --> E4 --> E1
    
    %% Styling
    classDef setup fill:#e3f2fd
    classDef dev fill:#f3e5f5
    classDef deps fill:#fff3e0
    classDef release fill:#e8f5e8
    classDef maintain fill:#fce4ec
    
    class A1,A2,A3,A4 setup
    class B1,B2,B3,B4,B5,B6,B7,B8 dev
    class C1,C2,C3,C4 deps
    class D1,D2,D3,D4,D5,D6 release
    class E1,E2,E3,E4 maintain
```

## Diagram 2: Lifecycle Tasks → CI/CD Workflows Mapping

```mermaid
graph LR
    subgraph "📋 Repository Tasks"
        T1[⚙️ Configure Secrets & Settings]
        T2[🏷️ Setup Labels & Rules]
        T3[🧪 Run Tests & Checks]
        T4[👋 Welcome Contributors]
        T5[🏷️ Auto-label Issues/PRs]
        T6[📋 Check for Updates]
        T7[🔄 Create Update PRs]
        T8[🏗️ Build Gem Package]
        T9[💎 Publish to RubyGems]
        T10[📝 Generate Changelog]
        T11[📢 Send Notifications]
        T12[🧹 Manage Stale Issues]
        T13[🌐 Check Ecosystem Health]
        T14[📈 Monitor Performance]
    end
    
    subgraph "🤖 Our CI/CD Workflows"
        W1[01-intake.yml<br/>🏷️ Intake & Labels]
        W2[02-ci.yml<br/>🧪 Continuous Integration]
        W3[03-security.yml<br/>🔒 Security Scanning]
        W4[04-quality.yml<br/>📊 Code Quality]
        W5[05-community.yml<br/>👥 Community Management]
        W6[06-release.yml<br/>🚀 Release & Publishing]
        W7[07-ecosystem.yml<br/>🌐 Ecosystem Integration]
        W8[08-monitoring.yml<br/>📈 Health Monitoring]
        W9[Dependabot<br/>📦 Dependency Updates]
    end
    
    %% Task to Workflow Mappings
    T1 -.-> W1
    T2 --> W1
    T3 --> W2
    T3 --> W3
    T3 --> W4
    T4 --> W1
    T5 --> W1
    T6 --> W9
    T7 --> W9
    T8 --> W6
    T9 --> W6
    T10 --> W6
    T11 --> W6
    T12 --> W5
    T13 --> W7
    T14 --> W8
    
    %% Styling
    classDef task fill:#e8f5e8
    classDef workflow fill:#f3e5f5
    
    class T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14 task
    class W1,W2,W3,W4,W5,W6,W7,W8,W9 workflow
```

## 📈 Repository Lifecycle Timeline

| Phase | Duration | Key Activities | Frequency |
|-------|----------|----------------|-----------|
| **🚀 Setup** | 1-2 days | Initial configuration, secrets, labels | Once |
| **💻 Development** | Ongoing | Code, test, review, merge | Daily |
| **📦 Dependencies** | Background | Automated dependency updates | Weekly |
| **🚀 Release** | 30 minutes | Tag, build, publish, notify | As needed |
| **🔄 Maintenance** | Background | Community management, monitoring | Daily/Weekly |

## 🎯 Task → Workflow Mapping Table

| Repository Task | Our CI/CD Solution | Trigger | Frequency |
|----------------|-------------------|---------|-----------|
| **⚙️ Configure Settings** | Manual setup | One-time | Once |
| **🏷️ Setup Labels** | `01-intake.yml` | Manual/Push | Once + updates |
| **🧪 Run Tests** | `02-ci.yml`, `03-security.yml`, `04-quality.yml` | Push/PR | Every change |
| **👋 Welcome Contributors** | `01-intake.yml` | First PR/Issue | Per new contributor |
| **🏷️ Auto-label** | `01-intake.yml` | PR/Issue created | Every PR/Issue |
| **📦 Update Dependencies** | Dependabot + CI workflows | Schedule | Weekly + testing |
| **🚀 Build & Publish** | `06-release.yml` | Tag created | Per release |
| **🧹 Manage Community** | `05-community.yml` | Schedule | Daily |
| **🌐 Check Ecosystem** | `07-ecosystem.yml` | Schedule | Weekly |
| **📈 Monitor Health** | `08-monitoring.yml` | Schedule | Daily |

## 🔄 Complete Development Flow

```
Repository Lifecycle:
Setup → Development ⟷ Dependencies → Release → Maintenance
  ↓         ↓             ↓            ↓         ↓
Our Workflows:
Manual → 01,02,03,04 → Dependabot+CI → 06 → 05,07,08
```

This separation makes it much clearer:
1. **First diagram**: Shows the natural lifecycle and tasks
2. **Second diagram**: Shows how our specific workflows handle those tasks
3. **Tables**: Provide detailed mapping and timing information