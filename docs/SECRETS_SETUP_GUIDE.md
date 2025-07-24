# 🔐 Repository Secrets Setup Guide

This guide walks you through setting up all required secrets for the automation workflows.

## 🎯 Overview

The automation workflows require several secrets to function properly. This guide covers all required and optional secrets with step-by-step setup instructions.

## 📋 Required Secrets

### **GitHub App Secrets** (Required for branded automation)

| Secret Name | Description | Required |
|-------------|-------------|----------|
| `GEM_CI_APP_ID` | Your GitHub App ID (numeric) | ✅ Yes |
| `GEM_CI_PRIVATE_KEY` | Your GitHub App private key (PEM format) | ✅ Yes |

### **Slack Integration Secrets** (Optional)

| Secret Name | Description | Required |
|-------------|-------------|----------|
| `SLACK_BOT_TOKEN` | Slack bot token (starts with `xoxb-`) | ❌ Optional |
| `SLACK_CHANNEL_ID` | Target Slack channel ID (e.g., `C1234567890`) | ❌ Optional |

### **RubyGems Publishing Secrets** (Optional)

| Secret Name | Description | Required |
|-------------|-------------|----------|
| `RUBYGEMS_API_KEY` | RubyGems.org API key for publishing | ❌ Optional |

## 🚀 Quick Setup

### **Step 1: Access Repository Settings**

1. Go to your repository on GitHub
2. Click **Settings** tab
3. In the sidebar, click **Secrets and variables** → **Actions**

### **Step 2: Add GitHub App Secrets**

#### **Create GitHub App** (if you haven't already)
Follow the detailed [GitHub App Setup Guide](GITHUB_APP_SETUP_GUIDE.md) to create your app.

#### **Add App Secrets**
1. Click **New repository secret**
2. Add `GEM_CI_APP_ID`:
   - **Name**: `GEM_CI_APP_ID`
   - **Value**: Your app ID (numeric, e.g., `123456`)
3. Click **Add secret**
4. Add `GEM_CI_PRIVATE_KEY`:
   - **Name**: `GEM_CI_PRIVATE_KEY`
   - **Value**: Your private key (entire PEM content including headers)
   ```
   -----BEGIN RSA PRIVATE KEY-----
   [Your private key content]
   -----END RSA PRIVATE KEY-----
   ```
5. Click **Add secret**

### **Step 3: Add Slack Secrets** (Optional)

#### **Create Slack App**
1. Go to https://api.slack.com/apps
2. Click **Create New App** → **From scratch**
3. Enter app name and select workspace
4. Go to **OAuth & Permissions**
5. Add bot token scopes:
   - `chat:write` (send messages)
   - `chat:write.public` (send to public channels)
6. Install app to workspace
7. Copy **Bot User OAuth Token**

#### **Get Channel ID**
1. Right-click on your Slack channel
2. Select **Copy link**
3. Extract channel ID from URL (e.g., `C1234567890`)

#### **Add Slack Secrets**
1. Add `SLACK_BOT_TOKEN`:
   - **Name**: `SLACK_BOT_TOKEN`
   - **Value**: Your bot token (starts with `xoxb-`)
2. Add `SLACK_CHANNEL_ID`:
   - **Name**: `SLACK_CHANNEL_ID`
   - **Value**: Your channel ID (starts with `C`)

### **Step 4: Add RubyGems Secret** (Optional)

#### **Get RubyGems API Key**
1. Go to https://rubygems.org
2. Sign in to your account
3. Go to **Edit Profile** → **API Keys**
4. Create new API key with **Push rubygems** scope
5. Copy the generated key

#### **Add RubyGems Secret**
1. Add `RUBYGEMS_API_KEY`:
   - **Name**: `RUBYGEMS_API_KEY`
   - **Value**: Your RubyGems API key

## 🧪 Testing Your Secrets

### **Test GitHub App**
Run the validation workflow:
1. Go to **Actions** tab
2. Select **🔑 Validate GitHub App Setup**
3. Click **Run workflow**
4. Check for successful token generation

### **Test Slack Integration**
Run the Slack validation workflow:
1. Go to **Actions** tab
2. Select **📢 Validate Slack Integration**
3. Click **Run workflow**
4. Check your Slack channel for test messages

## 🔒 Security Best Practices

### **GitHub App Security**
- ✅ **Minimal Permissions**: Only grant required permissions
- ✅ **Repository Scope**: Install only on needed repositories
- ✅ **Key Rotation**: Regenerate private key periodically
- ✅ **Audit Access**: Review app activity regularly

### **Slack Security**
- ✅ **Bot Scope**: Use bot tokens, not user tokens
- ✅ **Channel Specific**: Limit to specific channels
- ✅ **Token Rotation**: Regenerate tokens periodically
- ✅ **Workspace Control**: Monitor app installations

### **RubyGems Security**
- ✅ **Scoped Keys**: Use push-only API keys
- ✅ **MFA Enabled**: Enable 2FA on RubyGems account
- ✅ **Key Rotation**: Regenerate keys regularly
- ✅ **Gem Ownership**: Verify gem ownership

## 🔄 Secret Management

### **Updating Secrets**
1. Go to repository **Settings** → **Secrets and variables** → **Actions**
2. Click on secret name
3. Click **Update**
4. Enter new value
5. Click **Update secret**

### **Removing Secrets**
1. Go to repository **Settings** → **Secrets and variables** → **Actions**
2. Click on secret name
3. Click **Remove**
4. Confirm removal

### **Environment Variables**
Some workflows also support environment variables for non-sensitive configuration:

| Variable | Purpose | Example |
|----------|---------|---------|
| `RUBY_VERSION` | Default Ruby version | `3.3` |
| `NODE_VERSION` | Node.js version for docs | `18` |

## 👥 Code Reviews

**Automated Reviews**: The `.github/CODEOWNERS` file automatically requests reviews from repository maintainers for all changes, including Dependabot PRs. This replaces the deprecated `reviewers` field in Dependabot configuration.

## 🚨 Troubleshooting

### **GitHub App Issues**
- **Invalid App ID**: Ensure it's numeric (no quotes)
- **Private Key Format**: Include full PEM headers/footers
- **Permissions**: Verify app has required permissions
- **Installation**: Ensure app is installed on repository

### **Slack Issues**
- **Token Format**: Ensure starts with `xoxb-`
- **Channel ID**: Use channel ID, not channel name
- **Permissions**: Verify bot has write permissions
- **Workspace**: Ensure bot is added to workspace

### **RubyGems Issues**
- **API Key Scope**: Ensure has push permissions
- **Gem Name**: Verify gem name availability
- **Account**: Ensure account has publish rights
- **MFA**: Complete MFA setup if required

## 📚 Related Documentation

- [GitHub App Setup Guide](GITHUB_APP_SETUP_GUIDE.md) - Detailed GitHub App creation
- [Validation Workflows](workflows/tests/README.md) - Testing your setup
- [Template Conversion](TEMPLATE_CONVERSION_CHECKLIST.md) - Using secrets in templates

## ✅ Setup Checklist

- [ ] **GitHub App created** and secrets added
- [ ] **Slack app created** and secrets added (optional)
- [ ] **RubyGems API key** generated and added (optional)
- [ ] **CODEOWNERS file** configured for automated reviews
- [ ] **Validation workflows** tested successfully
- [ ] **Security practices** implemented
- [ ] **Documentation** reviewed and understood

🎉 **Congratulations!** Your repository is now configured with all necessary secrets for full automation functionality. 