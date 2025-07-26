# 🤖 Ruby Gem Automation Template

> **The ultimate automation template for Ruby gem projects** - Battle-tested workflows for seamless development, security, and releases.

## ✨ What This Provides

This repository serves as the **perfect template** for Ruby gem automation. It includes 8 comprehensive workflows that handle every aspect of your gem's lifecycle:

- 🔄 **Automated CI/CD** across Ruby versions and platforms
- 🔒 **Security scanning** and vulnerability detection  
- 📊 **Code quality** enforcement and coverage reporting
- 🚀 **Automated releases** with semantic versioning
- 👥 **Community management** and contributor engagement
- 📈 **Performance monitoring** and health checks

## 🚀 Quick Start

1. **Use this template** to create your new repository
2. **Set up secrets** following the [Secrets Setup Guide](docs/SECRETS_SETUP_GUIDE.md)
3. **Configure labels** by running the label sync workflow
4. **Import rulesets** from `.github/config/rulesets/`
5. **Start developing** - automation handles the rest!

## 📋 Complete Automation Tasks

| **Category**        | **Task**                | **Workflow**                             | **Action Used**                           | **Configuration**           |
| ------------------- | ----------------------- | ---------------------------------------- | ----------------------------------------- | --------------------------- |
| **🔄 CI/CD**         | Multi-Ruby testing      | `02-ci.yml`                              | `ruby/setup-ruby@v1`                      | Ruby 3.2, 3.3, 3.4          |
|                     | Cross-platform testing  | `02-ci.yml`                              | `actions/checkout@v4`                     | Ubuntu, macOS               |
|                     | Dependency caching      | `02-ci.yml`                              | `actions/cache@v3`                        | Bundler cache               |
|                     | Test execution          | `02-ci.yml`                              | Custom scripts                            | RSpec, Minitest             |
|                     | Coverage reporting      | `04-quality.yml`                         | `simplecov` gem                           | 90% threshold               |
| **🔒 Security**      | CodeQL analysis         | `03-security.yml`                        | `github/codeql-action@v3`                 | `.github/config/codeql.yml` |
|                     | Dependency scanning     | `03-security.yml`                        | `actions/dependency-review-action@v4`     | Vulnerability detection     |
|                     | Secret scanning         | `03-security.yml`                        | `trufflesecurity/trufflehog@main`         | Git history scan            |
|                     | Container scanning      | `03-security.yml`                        | `aquasecurity/trivy-action@master`        | Dockerfile security         |
|                     | Bundle audit            | `03-security.yml`                        | `bundler-audit` gem                       | Gem vulnerabilities         |
| **📊 Quality**       | Code linting            | `04-quality.yml`                         | `rubocop/rubocop-github-action@v0.1.0`    | RuboCop standards           |
|                     | Documentation           | `04-quality.yml`                         | `yard` gem                                | API documentation           |
|                     | Markdown linting        | `04-quality.yml`                         | `DavidAnson/markdownlint-cli2-action@v16` | Markdown standards          |
|                     | Super linting           | `04-quality.yml`                         | `super-linter/super-linter@v5`            | Multi-language linting      |
| **🏷️ Labels**        | Label sync              | `01-intake.yml`                          | `crazy-max/ghaction-github-labeler@v5`    | `.github/labels.yml`        |
|                     | Auto-labeling           | `01-intake.yml`                          | `actions/labeler@v5`                      | `.github/labeler.yml`       |
|                     | Size labeling           | `01-intake.yml`                          | Custom script                             | PR size detection           |
| **👥 Community**     | Welcome messages        | `01-intake.yml`                          | `actions/first-interaction@v1`            | First-time contributors     |
|                     | Stale management        | `05-community.yml`                       | `actions/stale@v9`                        | 60-day stale policy         |
|                     | Contributor recognition | `05-community.yml`                       | Custom script                             | Achievement badges          |
|                     | Health monitoring       | `08-monitoring.yml`                      | Custom script                             | Community metrics           |
| **🚀 Release**       | Semantic versioning     | `06-release.yml`                         | Custom script                             | Version bumping             |
|                     | Changelog generation    | `06-release.yml`                         | Custom script                             | Auto-generated changelogs   |
|                     | RubyGems publishing     | `06-release.yml`                         | `ruby/setup-ruby@v1`                      | Automated gem push          |
|                     | GitHub releases         | `06-release.yml`                         | `actions/create-release@v1`               | Release notes               |
|                     | Release notifications   | `06-release.yml`                         | `slackapi/slack-github-action@v1.27.0`    | Slack integration           |
| **📦 Dependencies**  | Dependency updates      | Dependabot                               | GitHub native                             | `.github/dependabot.yml`    |
|                     | Security updates        | Dependabot                               | GitHub native                             | Auto-merge safe updates     |
|                     | Version grouping        | Dependabot                               | GitHub native                             | Development/testing groups  |
| **🛡️ Protection**    | Branch protection       | Rulesets                                 | GitHub native                             | `.github/config/rulesets/`  |
|                     | Tag protection          | Rulesets                                 | GitHub native                             | Release tag protection      |
|                     | Push restrictions       | Rulesets                                 | GitHub native                             | Development branch rules    |
| **📢 Notifications** | Slack integration       | Multiple                                 | `slackapi/slack-github-action@v1.27.0`    | `SLACK_BOT_TOKEN`           |
|                     | Email notifications     | GitHub native                            | Repository settings                       | Configurable recipients     |
| **🧪 Validation**    | GitHub App setup        | `tests/validate-github-app.yml`          | `actions/create-github-app-token@v1`      | Token validation            |
|                     | Slack integration       | `tests/validate-slack-integration.yml`   | `slackapi/slack-github-action@v1.27.0`    | Message testing             |
|                     | Label sync              | `tests/validate-labels-sync.yml`         | `crazy-max/ghaction-github-labeler@v5`    | Configuration validation    |
|                     | Repository rulesets     | `tests/validate-repository-rulesets.yml` | Custom scripts                            | Ruleset validation          |

## 🔐 Required Setup

### **Secrets** (Required)
| Secret | Purpose | Required |
|--------|---------|----------|
| `APP_ID` | GitHub App ID for branded automation | ✅ Yes |
| `PRIVATE_KEY` | GitHub App private key | ✅ Yes |
| `SLACK_BOT_TOKEN` | Slack bot token for notifications | ❌ Optional |
| `SLACK_CHANNEL_ID` | Slack channel ID | ❌ Optional |
| `RUBYGEMS_API_KEY` | RubyGems publishing key | ❌ Optional |

### **Configuration Files**
| File | Purpose | Required |
|------|---------|----------|
| `.github/labels.yml` | Label definitions and colors | ✅ Yes |
| `.github/labeler.yml` | Auto-labeling rules | ✅ Yes |
| `.github/dependabot.yml` | Dependency update configuration | ✅ Yes |
| `.github/CODEOWNERS` | Code ownership and review assignments | ✅ Yes |
| `.github/config/codeql.yml` | CodeQL analysis configuration | ✅ Yes |
| `.github/config/rulesets/*.json` | Repository protection rules | ❌ Optional |

## 🔄 Ruby Gem Repository Lifecycle

This template provides a complete automation solution that follows the natural lifecycle of a Ruby gem repository:

### 🚀 **Phase 1: Repository Setup** (One-time)
- **🏷️ Label Management**: Sync professional labels with `01-intake.yml`
- **🔐 Secret Configuration**: Setup GitHub App authentication and integrations
- **🛡️ Branch Protection**: Configure repository rulesets and security policies
- **⚙️ Initial Configuration**: Dependabot, CodeQL, and workflow settings

### 💻 **Phase 2: Development Cycle** (Daily)
- **🧪 Continuous Testing**: Multi-Ruby version testing with `02-ci.yml`
- **🔒 Security Scanning**: Vulnerability detection with `03-security.yml`  
- **📊 Code Quality**: RuboCop linting and documentation with `04-quality.yml`
- **🏷️ Auto-labeling**: Smart PR/issue labeling with `01-intake.yml`
- **👋 Contributor Welcome**: First-time contributor guidance with `01-intake.yml`

### 📦 **Phase 3: Dependency Management** (Automated)
- **🤖 Dependabot Updates**: Weekly dependency update PRs
- **🧪 Update Testing**: Automated testing of dependency changes
- **✅ Safe Auto-merge**: Automatic merging of low-risk updates

### 🚀 **Phase 4: Release Process** (On-demand)
- **🏗️ Gem Building**: Automated gem packaging with `06-release.yml`
- **💎 RubyGems Publishing**: Direct publishing to RubyGems registry  
- **📝 Changelog Generation**: Automatic changelog and release notes
- **📢 Release Notifications**: Slack and GitHub release announcements

### 🔄 **Phase 5: Ongoing Maintenance** (Background)
- **🧹 Stale Management**: Automated stale issue cleanup with `05-community.yml`
- **🌐 Ecosystem Monitoring**: Compatibility checks with `07-ecosystem.yml`
- **📈 Health Monitoring**: Performance tracking with `08-monitoring.yml`
- **👥 Community Engagement**: Contributor recognition and community health

## 📚 Documentation

- **[🔄 Lifecycle Diagram](docs/diagrams/ci-workflow-overview.md)** - Visual repository lifecycle and workflow mapping
- **[🔐 Secrets Setup Guide](docs/SECRETS_SETUP_GUIDE.md)** - Complete secrets configuration
- **[🧪 Manual Testing Guide](docs/MANUAL_WORKFLOW_TESTING.md)** - How to test and trigger workflows manually
- **[🏷️ Labels Color Guide](docs/LABELS_COLOR_GUIDE.md)** - Label design and accessibility
- **[✅ Validation Workflows](.github/workflows/tests/README.md)** - Testing your setup

## 🎯 Key Features

### **🔄 Multi-Ruby Testing**
- Tests across Ruby 3.2, 3.3 and 3.4
- Cross-platform support (Ubuntu, macOS)
- Parallel test execution for speed

### **🔒 Comprehensive Security**
- CodeQL static analysis
- Dependency vulnerability scanning
- Secret detection in git history
- Container security scanning
- Automated security updates

### **📊 Quality Enforcement**
- RuboCop code style enforcement
- Test coverage reporting (90% threshold)
- Documentation coverage checking
- Markdown and YAML linting

### **🚀 Automated Releases**
- Semantic version bumping
- Automated changelog generation
- RubyGems publishing
- GitHub release creation
- Slack release notifications

### **👥 Community Management**
- Welcome messages for new contributors
- Stale issue/PR management
- Contributor achievement recognition
- Community health monitoring

### **🏷️ Smart Labeling**
- 33 professionally designed labels
- Automatic labeling based on file changes
- PR size detection and labeling
- Accessible color scheme (WCAG AA compliant)

## 🤝 Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Run validation workflows
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

---

**Note:** This template is designed for Ruby gem projects and may require adjustments for other languages or frameworks. It is battle-tested and ready to use, but always review and customize workflows to fit your specific needs.
