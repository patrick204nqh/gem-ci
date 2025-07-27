# 🧪 gem-ci Testing Scripts

This directory contains helper scripts for testing gem-ci workflows locally using the `act` CLI tool.

## 📋 Scripts Overview

| Script | Purpose | Usage |
|--------|---------|-------|
| **`test-local`** | Test main workflows with different events | `./scripts/test-local [EVENT]` |
| **`test-workflows`** | Run validation tests in `.github/workflows/tests/` | `./scripts/test-workflows` |

## 🚀 Quick Start

### **1. Setup**
```bash
# Copy example files
cp .secrets.example .secrets
cp .env.example .env.test

# Edit with your actual secrets
nano .secrets
nano .env.test

# Check setup
./scripts/test-local --setup
./scripts/test-workflows --setup
```

### **2. Test Main Workflows**
```bash
# Test push workflows (CI, Security, Quality)
./scripts/test-local

# Test pull request workflows
./scripts/test-local pull_request

# Test specific workflow
./scripts/test-local ci

# Test all workflows
./scripts/test-local all

# List available workflows
./scripts/test-local --list
```

### **3. Run Validation Tests**
```bash
# Run all validation tests
./scripts/test-workflows

# Run specific validation test
./scripts/test-workflows -t github-app

# List available tests
./scripts/test-workflows --list
```

## 🎯 test-local Script

Tests main gem-ci workflows using different GitHub events.

### **Events**
- `push` - Test push workflows (CI, Security, Quality) [default]
- `pull_request` - Test pull request workflows
- `schedule` - Test scheduled workflows (Community, Ecosystem, Monitoring)
- `workflow_dispatch` - Test manual workflow dispatch
- `all` - Test all main workflows

### **Workflow-Specific Tests**
- `ci` - Test CI workflow (02-ci.yml)
- `security` - Test Security workflow (03-security.yml)
- `quality` - Test Quality workflow (04-quality.yml)
- `community` - Test Community workflow (05-community.yml)
- `release` - Test Release workflow (06-release.yml) - **SAFE MODE**
- `ecosystem` - Test Ecosystem workflow (07-ecosystem.yml)
- `monitoring` - Test Monitoring workflow (08-monitoring.yml)
- `bot-commands` - Test Bot Commands workflow (09-bot-commands.yml)

### **Options**
- `-v, --verbose` - Enable verbose output
- `-d, --dry-run` - Dry run mode (for release testing)
- `-j, --job JOB` - Run specific job only
- `--no-secrets` - Run without secrets file
- `--runner IMAGE` - Use specific runner image

### **Examples**
```bash
# Basic usage
./scripts/test-local                    # Test push event
./scripts/test-local pull_request       # Test PR workflows
./scripts/test-local ci                 # Test CI workflow only

# Advanced usage
./scripts/test-local ci -j test-ruby    # Run specific job
./scripts/test-local release --dry-run  # Safely test release
./scripts/test-local -v                 # Verbose output

# Check status
./scripts/test-local --setup            # Check setup
./scripts/test-local --list             # List workflows
```

## 🔍 test-workflows Script

Runs validation tests from `.github/workflows/tests/` directory.

### **Available Tests**
- `github-app` - Test GitHub App authentication
- `labels-sync` - Test labels synchronization  
- `slack-integration` - Test Slack integration
- `repository-rules` - Test repository rulesets

### **Options**
- `-t, --test TEST` - Run specific test workflow
- `-v, --verbose` - Enable verbose output
- `--no-secrets` - Run without secrets file
- `--runner IMAGE` - Use specific runner image

### **Examples**
```bash
# Basic usage
./scripts/test-workflows                           # Run all tests
./scripts/test-workflows -t github-app             # Run specific test

# Advanced usage
./scripts/test-workflows -v                        # Verbose output
./scripts/test-workflows --list                    # List available tests
./scripts/test-workflows --setup                   # Check setup
```

## 🔐 Secrets & Environment Setup

Both scripts use the same configuration files:

### **Secrets File (.secrets)**
```bash
# Copy and edit
cp .secrets.example .secrets
nano .secrets
```

Required secrets:
- `GITHUB_TOKEN` - GitHub personal access token
- `APP_ID` - GitHub App ID  
- `PRIVATE_KEY` - GitHub App private key

Optional secrets:
- `SLACK_BOT_TOKEN` - For Slack notifications
- `SLACK_CHANNEL_ID` - Slack channel ID
- `RUBYGEMS_API_KEY` - For gem publishing tests

### **Environment File (.env.test)**
```bash
# Copy and edit
cp .env.example .env.test
nano .env.test
```

Common environment variables:
- `RUBY_VERSION=3.3` - Ruby version override
- `DRY_RUN=true` - Prevent actual publishing
- `DEBUG=true` - Enable debug output

## 🎭 Runner Images

Both scripts support different runner images:

| Size | Image | Description |
|------|-------|-------------|
| **Small** | `node:16-buster-slim` | ~200MB, basic Node.js |
| **Medium** | `catthehacker/ubuntu:act-latest` | ~500MB, balanced [default] |
| **Large** | `catthehacker/ubuntu:full-latest` | Full Ubuntu environment |

```bash
# Use different runner
./scripts/test-local --runner catthehacker/ubuntu:full-latest
./scripts/test-workflows --runner node:16-buster-slim
```

## 🔧 Troubleshooting

### **Setup Issues**
```bash
# Check requirements
./scripts/test-local --setup
./scripts/test-workflows --setup

# Common fixes
brew install act                    # Install act
open -a Docker                     # Start Docker (macOS)
cp .secrets.example .secrets        # Create secrets file
```

### **First Run Performance**
The first time you run tests, it may take several minutes because:
- Docker images need to be downloaded (~500MB for medium runner)
- Ruby dependencies need to be installed
- Actions need to be cached

Subsequent runs will be much faster due to caching.

### **Test Failures**
```bash
# Debug with verbose output
./scripts/test-local ci -v
./scripts/test-workflows -t github-app -v

# Test without secrets (if secrets are the issue)
./scripts/test-local --no-secrets
./scripts/test-workflows --no-secrets
```

### **Performance Issues**
```bash
# Use smaller runner image
./scripts/test-local --runner node:16-buster-slim

# Test specific jobs only
./scripts/test-local ci -j test-ruby
```

## 💡 Pro Tips

1. **Use .actrc for permanent configuration:**
   ```bash
   cat > ~/.actrc << 'EOF'
   -P ubuntu-latest=catthehacker/ubuntu:act-latest
   --secret-file .secrets
   EOF
   ```

2. **Test before pushing:**
   ```bash
   ./scripts/test-local        # Test push workflows
   ./scripts/test-workflows    # Validate setup
   ```

3. **Safe release testing:**
   ```bash
   ./scripts/test-local release --dry-run
   ```

4. **Quick validation:**
   ```bash
   ./scripts/test-workflows -t github-app
   ```

## 🚨 Security Notes

- Never commit `.secrets` file to repository
- Use test Slack channels for local testing
- Release workflows run in dry-run mode by default
- Consider using separate secrets for testing vs production

---

**Need help?** Check the [local testing guide](../docs/guides/local-testing.md) for detailed setup instructions.