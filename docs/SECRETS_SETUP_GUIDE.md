# 🔐 Secrets Setup Guide
*Complete guide for configuring all required secrets for gem-ci workflows*

## 🎯 Overview

This guide walks you through setting up all required secrets for gem-ci workflows, including GitHub App authentication, Slack integration, and RubyGems publishing.

## 🔐 Required Secrets Overview

The gem-ci workflows require the following secrets:

| Secret | Purpose | Required | Setup Section |
|--------|---------|----------|---------------|
| `APP_ID` | GitHub App ID for branded automation | ✅ Yes | Step 1-2 |
| `PRIVATE_KEY` | GitHub App private key | ✅ Yes | Step 1-2 |
| `SLACK_BOT_TOKEN` | Slack bot token for notifications | ❌ Optional | Step 3 |
| `SLACK_CHANNEL_ID` | Slack channel ID | ❌ Optional | Step 3 |
| `RUBYGEMS_API_KEY` | RubyGems publishing key | ❌ Optional | Step 4 |

## 📋 Prerequisites

- GitHub repository with admin access
- GitHub account with developer settings access
- Basic understanding of GitHub secrets

## 🚀 Step-by-Step Setup

### **Step 1: Create GitHub App**

1. **Navigate to GitHub Developer Settings**
   - Go to [GitHub Developer Settings](https://github.com/settings/developers)
   - Click **"New GitHub App"**

2. **Configure Basic App Settings**
   ```yaml
   GitHub App name: gem-ci-automation
   Description: Professional automation for Ruby gem projects
   Homepage URL: https://github.com/YOUR_USERNAME/YOUR_REPO
   Webhook URL: https://api.github.com/repos/YOUR_USERNAME/YOUR_REPO/dispatches
   Webhook secret: (leave empty for now)
   ```

3. **Set Repository Permissions**
   ```yaml
   Repository permissions:
     Actions: Read and write
     Checks: Write  
     Contents: Write
     Issues: Write
     Metadata: Read
     Pull requests: Write
     Commit statuses: Write
   
   Account permissions:
     Email addresses: Read
   ```

4. **Configure App Settings**
   - ✅ **Webhook**: Active
   - ✅ **Where can this GitHub App be installed?**: Only on this account
   - ❌ **Request user authorization (OAuth) during installation**: Unchecked

5. **Create the App**
   - Click **"Create GitHub App"**
   - Note down the **App ID** (you'll need this)

### **Step 2: Generate Private Key**

1. **In your newly created app settings:**
   - Scroll to **"Private keys"** section
   - Click **"Generate a private key"**
   - Download the `.pem` file securely

2. **Convert PEM for GitHub Secrets:**
   ```bash
   # The downloaded file content should look like:
   -----BEGIN RSA PRIVATE KEY-----
   [Your private key content]
   -----END RSA PRIVATE KEY-----
   ```

### **Step 3: Install App on Repository**

1. **Install the App:**
   - In app settings, click **"Install App"** in left sidebar
   - Click **"Install"** next to your account
   - Select **"Only select repositories"**
   - Choose your gem project repository
   - Click **"Install"**

### **Step 4: Configure Repository Secrets**

1. **Navigate to Repository Settings:**
   - Go to your repository
   - Click **Settings** → **Secrets and variables** → **Actions**

2. **Add Required Secrets:**

   **Secret 1: `APP_ID`**
   ```
   Name: APP_ID
   Value: [Your App ID from Step 1]
   Example: 123456
   ```

   **Secret 2: `PRIVATE_KEY`**
   ```
   Name: PRIVATE_KEY  
   Value: [Complete contents of your .pem file]
   Example:
   -----BEGIN RSA PRIVATE KEY-----
   MIIEpAIBAAKCAQEA1234567890abcdef...
   [Full private key content]
   ...xyz789
   -----END RSA PRIVATE KEY-----
   ```

### **Step 5: Customize App Appearance**

1. **Upload Custom Avatar:**
   - In app settings, scroll to **"Display information"**
   - Upload a custom logo (💎 + ⚙️ design recommended)
   - Add description: "Professional automation for Ruby gem projects"

2. **Set App Colors:**
   - Choose brand colors that match your project
   - Ensure good contrast for readability

## 🧪 Test Your Setup

### **Test 1: Validate GitHub App**

1. **Trigger the validation workflow** from `.github/workflows/tests/validate-github-app.yml`
2. **Check the activity log** - you should see your custom bot name
3. **Verify avatar** appears correctly in GitHub interface

### **Test 2: Validate Slack Integration** (Optional)

1. **Set up Slack bot** (see `.github/workflows/tests/README.md` for detailed instructions)
2. **Add Slack secrets** to repository settings
3. **Trigger the Slack validation workflow** from `.github/workflows/tests/validate-slack-integration.yml`
4. **Check your Slack channel** for test messages from your branded bot

> **📁 Note**: Test workflows are organized in `.github/workflows/tests/` to keep them separate from production workflows.

## 🔒 Security Best Practices

### **Private Key Security**
- ✅ **Never commit** the `.pem` file to version control
- ✅ **Store securely** in GitHub repository secrets only
- ✅ **Limit access** to repository admins only
- ✅ **Rotate regularly** (recommended every 6 months)

### **App Permissions**
- ✅ **Minimal permissions** - only what's needed
- ✅ **Repository-specific** installation
- ✅ **Regular audits** of app permissions
- ✅ **Monitor usage** in app settings

### **Secret Management**
- ✅ **Use GitHub secrets** (never environment variables in code)
- ✅ **Descriptive names** (`APP_ID`, `PRIVATE_KEY` for clarity)
- ✅ **Document requirements** for team members
- ✅ **Backup strategy** for private keys

## 🎨 Customization for Your Project

### **For gem-ci Template Users**

When copying the gem-ci template, update these values:

```yaml
# Replace in your GitHub App settings:
App name: YOUR_PROJECT-automation
Description: Professional automation for YOUR_PROJECT
Homepage URL: https://github.com/YOUR_USERNAME/YOUR_PROJECT

# Replace in repository secrets:
APP_ID → Your GitHub App ID
PRIVATE_KEY → Your GitHub App private key

# Update in workflow files:
gem-ci[bot] → YOUR_PROJECT[bot]
```

### **Branding Variables**

The gem-ci CLI tool will help replace these automatically:

```yaml
Template Variables:
  {{GEM_NAME}} → your-gem-name
  {{AUTHOR_NAME}} → Your Name  
  {{AUTHOR_EMAIL}} → your@email.com
  {{REPO_URL}} → https://github.com/you/your-repo
  
Branding Variables:
  {{APP_ID}} → Your GitHub App ID
  {{APP_PRIVATE_KEY}} → Your private key
  {{BOT_NAME}} → your-gem-name[bot]
```

## 🚨 Troubleshooting

### **Common Issues**

**Issue: "Bad credentials" error**
```
Solution: 
1. Verify APP_ID secret is correct (numeric value)
2. Check PRIVATE_KEY format (includes BEGIN/END lines)
3. Ensure app is installed on the repository
```

**Issue: "Resource not accessible by integration"**
```
Solution:
1. Check app permissions in GitHub App settings
2. Verify app is installed with correct repository access
3. Ensure workflow uses app token, not GITHUB_TOKEN
```

**Issue: "App not found" error**
```
Solution:
1. Verify APP_ID secret matches your created app
2. Check app is active (not suspended)
3. Confirm secrets are set in correct repository
```

### **Debug Steps**

1. **Verify App Creation:**
   - Check app exists in [Developer Settings](https://github.com/settings/developers)
   - Confirm app ID matches secret value

2. **Check Installation:**
   - Go to app settings → Install App
   - Verify installation on correct repository

3. **Test Token Generation:**
   - Run test workflow above
   - Check workflow logs for errors

4. **Validate Permissions:**
   - Review app permissions in settings
   - Ensure all required permissions are granted

## 📚 Additional Resources

### **GitHub Documentation**
- [Creating a GitHub App](https://docs.github.com/en/developers/apps/building-github-apps/creating-a-github-app)
- [Authenticating with GitHub Apps](https://docs.github.com/en/developers/apps/building-github-apps/authenticating-with-github-apps)
- [Installing GitHub Apps](https://docs.github.com/en/developers/apps/managing-github-apps/installing-github-apps)

### **Security References**
- [Securing your GitHub Apps](https://docs.github.com/en/developers/apps/getting-started-with-apps/about-apps#security)
- [Best practices for GitHub Apps](https://docs.github.com/en/developers/apps/getting-started-with-apps/best-practices-for-creating-a-github-app)

### **Action Documentation**
- [actions/create-github-app-token](https://github.com/actions/create-github-app-token) - Official GitHub action for app token generation
- [slackapi/slack-github-action](https://github.com/slackapi/slack-github-action) - Official Slack action for notifications

## 🔐 Required Secrets

Add these secrets to your repository settings (`Settings > Secrets and variables > Actions`):

### **GitHub App Secrets**
- **`APP_ID`**: Your GitHub App ID (numeric)
- **`PRIVATE_KEY`**: Your GitHub App private key (PEM format)

### **Slack Integration Secrets** (Optional)
- **`SLACK_BOT_TOKEN`**: Your Slack bot token (starts with `xoxb-`)
- **`SLACK_CHANNEL_ID`**: Target Slack channel ID (e.g., `C1234567890`)

> 💡 **Note**: Slack integration now uses bot tokens instead of webhook URLs for better control and branded messaging.

## ✅ Setup Checklist

- [ ] GitHub App created with correct permissions
- [ ] Private key generated and downloaded securely
- [ ] App installed on target repository
- [ ] `APP_ID` secret configured
- [ ] `PRIVATE_KEY` secret configured  
- [ ] Custom avatar uploaded
- [ ] Test workflow runs successfully
- [ ] Branded bot appears in activity logs
- [ ] All automation workflows updated to use app token

---

🎉 **Congratulations!** Your gem-ci automation now has professional branding. Every interaction will appear as your custom bot, building recognition and trust for your project. 