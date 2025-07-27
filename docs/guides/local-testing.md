---
title: Local Testing Guide
description: Test GitHub Actions workflows locally using act with real integrations
---

# 🧪 Local Testing Guide

*Test your gem-ci workflows locally with real Slack notifications and GitHub integration*

## 🎯 Quick Start

### **Install act**

**Prerequisites:** Docker must be installed and running

```bash
# Official installation script (Linux/macOS)
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Homebrew (macOS/Linux)
brew install act

# Chocolatey (Windows)
choco install act-cli

# GitHub CLI extension
gh extension install https://github.com/nektos/gh-act
```

### **Basic Local Testing**

```bash
# List available workflows and jobs
act -l

# Test all workflows triggered by push (default event)
act

# Test all workflows triggered by pull request
act pull_request

# Test specific workflow file
act -W .github/workflows/02-ci.yml

# Test specific job in workflow
act -j test-ruby
```

## 🔐 Setup Secrets for Real Integrations

### **Create Secrets File**

act supports multiple ways to provide secrets. The recommended approach is using a secrets file:

```bash
# Copy the example file and fill in your values
cp .secrets.example .secrets

# Edit with your actual secrets
nano .secrets

# Secure the secrets file
chmod 600 .secrets

# Ensure it's in .gitignore
echo ".secrets" >> .gitignore
```

**Example .secrets file format:**
```bash
# GitHub Token (required)
GITHUB_TOKEN=github_pat_11ABCDEFG_your_token_here

# GitHub App (required for some workflows)
APP_ID=123456
PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----
your_private_key_content_here
-----END RSA PRIVATE KEY-----"

# Slack Integration (optional)
SLACK_BOT_TOKEN=xoxb-1234567890-1234567890123-abc123
SLACK_CHANNEL_ID=C1234567890

# RubyGems Publishing (optional)
RUBYGEMS_API_KEY=rubygems_your_api_key_here
```

**Alternative methods:**
```bash
# Pass individual secrets via command line
act -s GITHUB_TOKEN=your_token

# Interactive secret input (secure, not saved in shell history)
act -s GITHUB_TOKEN

# Load from custom secrets file
act --secret-file my-secrets.env
```

### **Get Required Secrets**

**GitHub Token:**
1. Go to GitHub → Settings → Developer settings → Personal access tokens
2. Create token with `repo`, `workflow`, `write:packages` permissions
3. Copy token to `.secrets` file

**Slack Integration:**
1. Create Slack App at [api.slack.com](https://api.slack.com/apps)
2. Add `chat:write` OAuth scope
3. Install app to workspace
4. Copy Bot User OAuth Token (starts with `xoxb-`)
5. Get Channel ID from Slack (right-click channel → View channel details)

**RubyGems API Key:**
1. Login to [rubygems.org](https://rubygems.org)
2. Go to Account → API Keys
3. Create new API key with push permissions

## 🚀 Run Workflows with Real Integrations

### **Test CI with Slack Notifications**

```bash
# Run CI workflow with real Slack notifications
act -W .github/workflows/02-ci.yml --secret-file .secrets

# Test Quality workflow with notifications
act -W .github/workflows/04-quality.yml --secret-file .secrets
```

### **Test Specific Events**

```bash
# Test push event (default) - triggers CI, Security, Quality
act --secret-file .secrets

# Test pull request event
act pull_request --secret-file .secrets

# Test workflow dispatch (manual trigger)
act workflow_dispatch --secret-file .secrets

# Test scheduled workflows
act schedule --secret-file .secrets
```

### **Test with Custom Events**

```bash
# Create custom event file
cat > test-event.json << 'EOF'
{
  "pull_request": {
    "number": 123,
    "head": { "ref": "feature-branch" },
    "base": { "ref": "main" }
  }
}
EOF

# Use custom event
act pull_request -e test-event.json --secret-file .secrets
```

## 🎭 Test Different Runner Images

act uses different Docker images to simulate GitHub runners:

| Size | Image | Description |
|------|-------|-------------|
| **Small** | `node:16-buster-slim` | ~200MB, basic Node.js environment |
| **Medium** | `catthehacker/ubuntu:act-latest` | ~500MB, good balance |
| **Large** | `catthehacker/ubuntu:full-latest` | Full Ubuntu environment |

```bash
# Use medium-sized runner (recommended)
act -P ubuntu-latest=catthehacker/ubuntu:act-latest --secret-file .secrets

# Use small runner (fastest download)
act -P ubuntu-latest=node:16-buster-slim --secret-file .secrets

# Use full runner (most complete)
act -P ubuntu-latest=catthehacker/ubuntu:full-latest --secret-file .secrets
```

## 🔍 Debug Workflows

```bash
# Run with verbose output
act -v --secret-file .secrets

# Run specific job only
act -j build-gem -W .github/workflows/06-release.yml --secret-file .secrets

# Test without network calls (offline mode)
act --action-offline-mode --secret-file .secrets
```

## 🔥 Test Release Workflow (Safely)

**Important:** Be careful with release workflows to avoid accidental publishing.

```bash
# Test with environment variables to control behavior
cat > .env.test << 'EOF'
DRY_RUN=true
SKIP_PUBLISH=true
EOF

# Test release workflow with test environment
act -W .github/workflows/06-release.yml --secret-file .secrets --env-file .env.test

# Test specific release job only
act -j build-gem -W .github/workflows/06-release.yml --secret-file .secrets
```

**Environment Variables for Testing:**
```bash
# Copy example environment file
cp .env.example .env.test

# Pass environment variables directly
act --env DRY_RUN=true --env SKIP_PUBLISH=true --secret-file .secrets

# Load from environment file
act --env-file .env.test --secret-file .secrets
```

**Example .env.test file:**
```bash
# Ruby version override
RUBY_VERSION=3.3

# Testing flags
DRY_RUN=true
SKIP_PUBLISH=true
DEBUG=true

# Workflow overrides
DEFAULT_TIMEOUT=300
API_RETRY_COUNT=3
```

## 📱 Real Slack Notifications

When testing with real secrets, you'll get actual Slack notifications using the **official Slack GitHub Action**:

```bash
# This will send real Slack messages with rich formatting
act -W .github/workflows/02-ci.yml --secret-file .secrets
```

**Expected Slack Message Format:**
- **Header**: ✅ 02 - CI  
- **Repository**: your-username/your-repo
- **Status**: success
- **Branch**: main  
- **Commit**: [abc1234](commit-link)
- **Message**: CI Pipeline completed for main
- **Action Button**: "View Workflow Run"

The notifications use Slack's Block Kit for rich formatting and include clickable links to commits and workflow runs.

## 🧹 Cleanup

```bash
# Remove secrets and test files (keep .example files)
rm .secrets .env.test .env.local test-event.json

# Remove Docker images used by act (optional)
docker rmi catthehacker/ubuntu:act-latest
docker rmi node:16-buster-slim

# Clean up Docker system (optional)
docker system prune
```

## 💡 Pro Tips

**Use Configuration File:**
```bash
# Create ~/.actrc for permanent settings (one argument per line)
cat > ~/.actrc << 'EOF'
-P ubuntu-latest=catthehacker/ubuntu:act-latest
--secret-file .secrets
--env-file .env
EOF
```

**Quick Test Commands:**
```bash
# Test before pushing (default push event)
act --secret-file .secrets

# Test PR checks
act pull_request --secret-file .secrets

# Test specific job
act -j test-ruby --secret-file .secrets

# Test with variables (for ${{ vars.VARIABLE }})
act --var MY_VAR=value --secret-file .secrets
```

**Environment Variables:**
```bash
# Pass individual environment variables 
act --env RUBY_VERSION=3.2 --secret-file .secrets

# Load from .env file (dotenv format)
act --env-file .env.local --secret-file .secrets
```

## 🚨 Security Notes

- Never commit `.secrets` file to repository
- Use different secrets for testing vs production
- Rotate secrets regularly
- Consider using test Slack channels for local testing

---

**Need help?** Check the [secrets setup guide](../setup/secrets.md) for detailed secret configuration.