<div align="center">

# 🏆 gem-ci

<img src="public/gem-ci-transparent-bg.png" alt="gem-ci Logo" width="200">

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

**9 comprehensive workflows** for complete Ruby gem automation:

- 🔄 **CI/CD** with consolidated PR dashboard
- 🔒 **Security** scanning and vulnerability detection  
- 📊 **Quality** enforcement and documentation
- 🚀 **Releases** with semantic versioning
- 👥 **Community** management and engagement
- 🤖 **Bot commands** for workflow control

## 🚀 Quick Start

1. **Use this template** to create your new repository
2. **Set up secrets** following the [Secrets Setup Guide](docs/setup/secrets.md)
3. **Configure labels** by running the label sync workflow
4. **Import rulesets** from `.github/config/rulesets/`
5. **Test locally** using our [Local Testing Guide](docs/guides/local-testing.md)
6. **Start developing** - automation handles the rest!


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

**75-80% cost reduction** • **Consolidated PR dashboard** • **Interactive bot commands** • **Comprehensive security** • **Automated releases**

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
