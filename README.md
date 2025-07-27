<div align="center">

# 🏆 gem-ci

![gem-ci Logo](public/gem-ci-transparent-bg.png)

**The Ultimate Ruby Gem Automation Showcase**

*Battle-tested GitHub Actions workflows with comprehensive CI/CD, security, and community management*

[![Ruby](https://img.shields.io/badge/Ruby-3.3+-CC342D?style=for-the-badge&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE.txt)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](CONTRIBUTING.md)

[![CI Status](https://github.com/patrick204nqh/gem-ci/workflows/02%20-%20CI/badge.svg)](https://github.com/patrick204nqh/gem-ci/actions/workflows/02-ci.yml)
[![Security](https://github.com/patrick204nqh/gem-ci/workflows/03%20-%20Security/badge.svg)](https://github.com/patrick204nqh/gem-ci/actions/workflows/03-security.yml)
[![Quality Gate](https://github.com/patrick204nqh/gem-ci/workflows/04%20-%20Quality/badge.svg)](https://github.com/patrick204nqh/gem-ci/actions/workflows/04-quality.yml)

</div>

## ✨ What This Provides

This repository serves as the **ultimate showcase** for Ruby gem automation. It includes **9 comprehensive workflows** that handle every aspect of your gem's lifecycle:

- 🔄 **Automated CI/CD** with consolidated PR status dashboard
- 🔒 **Security scanning** and vulnerability detection  
- 📊 **Code quality** enforcement with focused linting
- 🚀 **Automated releases** with semantic versioning
- 👥 **Community management** and contributor engagement
- 📈 **Performance monitoring** and ecosystem health
- 🤖 **Bot commands** for interactive workflow management
- 🌐 **Ecosystem integration** and compatibility checks
- 📊 **Advanced monitoring** with cost-optimized scheduling

## 🚀 Quick Start

1. **Use this template** to create your new repository
2. **Set up secrets** following the [Secrets Setup Guide](docs/setup/secrets.md)
3. **Configure labels** by running the label sync workflow
4. **Import rulesets** from `.github/config/rulesets/`
5. **Test locally** using our [Local Testing Guide](docs/guides/local-testing.md)
6. **Start developing** - automation handles the rest!

## 📋 Complete Automation Tasks

| **Category**        | **Task**                | **Workflow**                             | **Action Used**                           | **Configuration**           |
| ------------------- | ----------------------- | ---------------------------------------- | ----------------------------------------- | --------------------------- |
| **🔄 CI/CD**         | Ruby testing            | `02-ci.yml`                              | `ruby/setup-ruby@v1`                      | Ruby 3.3 (optimized)       |
|                     | Ubuntu testing          | `02-ci.yml`                              | `actions/checkout@v4`                     | Ubuntu-latest (cost optimized) |
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
| **🏷️ Labels**        | Label sync              | `01-intake.yml`                          | `crazy-max/ghaction-github-labeler@v5`    | `.github/config/labels.yml` |
|                     | Auto-labeling           | `01-intake.yml`                          | `actions/labeler@v5`                      | `.github/config/labeler.yml` |
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
| **📢 Notifications** | Slack integration       | Multiple                                 | Custom shared action                      | `SLACK_BOT_TOKEN` + `SLACK_CHANNEL_ID` |
|                     | PR Status Dashboard     | Multiple                                 | `update-pr-status` action                 | Consolidated PR comments    |
| **🤖 Bot Commands**  | Release management      | `09-bot-commands.yml`                    | `actions/github-script@v7`               | Slash commands              |
|                     | Help system             | `09-bot-commands.yml`                    | `actions/github-script@v7`               | Interactive help            |
| **🌐 Ecosystem**     | Dependency health       | `07-ecosystem.yml`                       | Custom scripts                            | Bi-weekly checks            |
|                     | Compatibility matrix   | `07-ecosystem.yml`                       | `ruby/setup-ruby@v1`                      | Ruby version testing        |
|                     | Performance benchmarks | `07-ecosystem.yml`                       | Custom benchmark scripts                 | Release validation          |
| **📊 Monitoring**    | Workflow metrics        | `08-monitoring.yml`                      | `actions/github-script@v7`               | Weekly performance tracking |
|                     | Repository health       | `08-monitoring.yml`                      | Custom health checks                      | Automated health reports    |
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
| `.github/config/labels.yml` | Label definitions and colors | ✅ Yes |
| `.github/config/labeler.yml` | Auto-labeling rules for PRs | ✅ Yes |
| `.github/dependabot.yml` | Dependency update configuration | ✅ Yes |
| `.github/CODEOWNERS` | Code ownership and review assignments | ✅ Yes |
| `.github/config/codeql.yml` | CodeQL analysis configuration | ✅ Yes |
| `.github/config/release-please-config.json` | Release configuration | ✅ Yes |
| `.github/config/release-please-manifest.json` | Release manifest | ✅ Yes |
| `.github/config/rulesets/*.json` | Repository protection rules | ❌ Optional |

### **Bot Commands**
<details>
<summary>Available interactive commands (comment on issues/PRs)</summary>

| Command | Description | Example |
|---------|-------------|---------|
| `/gem-ci help` | Show available commands | `/gem-ci help` |
| `/gem-ci revise release [from] to [to]` | Change release type | `/gem-ci revise release minor to patch` |
| `/gem-ci cancel release` | Cancel current release PR | `/gem-ci cancel release` |

**Usage**: Comment these commands on any issue or PR to trigger bot actions.
</details>

## 🔄 Ruby Gem Repository Lifecycle

This template provides a complete automation solution that follows the natural lifecycle of a Ruby gem repository:

### 🚀 **Phase 1: Repository Setup** (One-time)
- **🏷️ Label Management**: Sync professional labels and organize repository structure
- **🔐 Secret Configuration**: Setup GitHub App authentication and integrations
- **🛡️ Branch Protection**: Configure repository rulesets and security policies
- **⚙️ Initial Configuration**: Setup dependency management, security scanning, and automation workflows

### 💻 **Phase 2: Development Cycle** (Daily)
- **🧪 Continuous Testing**: Run comprehensive test suites and validate gem functionality
- **🔒 Security Scanning**: Detect vulnerabilities in code and dependencies
- **📊 Code Quality**: Enforce coding standards, style guides, and generate documentation
- **🏷️ Auto-labeling**: Automatically categorize and organize issues and pull requests
- **👋 Contributor Welcome**: Guide first-time contributors and provide context

### 📦 **Phase 3: Dependency Management** (Automated)
- **🤖 Dependency Updates**: Monitor and update gem dependencies automatically
- **🧪 Update Testing**: Validate compatibility and functionality after updates
- **✅ Safe Auto-merge**: Automatically merge low-risk dependency updates
- **📊 Security Auditing**: Scan dependencies for known vulnerabilities

### 🚀 **Phase 4: Release Process** (On-demand)
- **🏗️ Gem Building**: Package gem files with proper versioning and metadata
- **💎 RubyGems Publishing**: Publish to RubyGems registry with proper validation
- **📝 Changelog Generation**: Generate release notes and update documentation
- **📢 Release Notifications**: Announce releases to team and community channels

### 🔄 **Phase 5: Ongoing Maintenance** (Background)
- **🧹 Stale Management**: Clean up inactive issues and pull requests
- **🌐 Ecosystem Monitoring**: Check compatibility with Ruby versions and dependencies
- **📈 Health Monitoring**: Track repository activity, performance, and community engagement
- **👥 Community Engagement**: Recognize contributors and maintain project health
- **🤖 Interactive Commands**: Provide bot-driven release management and workflow control

## 📚 Documentation

Complete documentation is available on our **[Documentation Site](https://patrick204nqh.github.io/gem-ci/)** including:

- **🚀 Getting Started**: Setup guides, secrets configuration, and local testing
- **📊 Workflows**: Complete workflow documentation and architecture overview  
- **🎯 Advanced Features**: Customization, integrations, and bot commands
- **✅ Validation**: Testing and troubleshooting guides

### **🧪 Quick Local Testing**

```bash
# Setup (one time)
cp .secrets.example .secrets && nano .secrets

# Test workflows locally
./scripts/test-local              # Test push workflows
./scripts/test-local ci           # Test CI workflow  
./scripts/test-workflows          # Run validation tests
```

**[📖 View Testing Scripts Documentation](scripts/README.md)**

## 🎯 Key Features

**🔄 Optimized CI/CD** • **🔒 Comprehensive Security** • **📊 Quality Enforcement** • **🚀 Automated Releases** • **👥 Community Management** • **🏷️ Smart Labeling**

Includes **9 optimized workflows** with 75-80% cost reduction, custom linting, consolidated PR dashboard, automated releases, and comprehensive security scanning.

**[📖 View Complete Feature List](docs/workflows/overview.md)**

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
