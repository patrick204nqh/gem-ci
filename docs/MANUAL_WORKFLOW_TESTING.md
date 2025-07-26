# 🧪 Manual Workflow Testing Guide

This guide explains how to manually test and trigger gem-ci workflows for validation and troubleshooting.

## 🚀 Manual Workflow Triggers

### Main Workflows (01-08)

Most main workflows trigger automatically on events, but some can be triggered manually:

| Workflow | File | Manual Trigger | Purpose |
|----------|------|----------------|---------|
| 01 - Intake | `01-intake.yml` | ✅ Yes | Sync labels and configurations |
| 02 - CI | `02-ci.yml` | ❌ Auto only | Push/PR testing |
| 03 - Security | `03-security.yml` | ❌ Auto only | Security scans |
| 04 - Quality | `04-quality.yml` | ❌ Auto only | Code quality checks |
| 05 - Community | `05-community.yml` | ❌ Auto only | Stale management |
| 06 - Release | `06-release.yml` | ❌ Auto only | Tag-based releases |
| 07 - Ecosystem | `07-ecosystem.yml` | ❌ Auto only | Ecosystem checks |
| 08 - Monitoring | `08-monitoring.yml` | ❌ Auto only | Scheduled monitoring |

### Test Workflows

All validation workflows support manual triggering:

| Validation Workflow | Purpose | Required Secrets |
|-------------------|---------|------------------|
| `validate-github-app.yml` | Test GitHub App setup | `APP_ID`, `PRIVATE_KEY` |
| `validate-slack-integration.yml` | Test Slack notifications | `APP_ID`, `PRIVATE_KEY`, `SLACK_BOT_TOKEN`, `SLACK_CHANNEL_ID` |
| `validate-labels-sync.yml` | Test label synchronization | `APP_ID`, `PRIVATE_KEY` |
| `validate-repository-rulesets.yml` | Test repository rulesets | `APP_ID`, `PRIVATE_KEY` |

## 📋 How to Manually Trigger Workflows

### Method 1: GitHub Web Interface

1. **Navigate to Actions Tab**
   - Go to your repository on GitHub
   - Click the **"Actions"** tab

2. **Select Workflow**
   - Find the workflow you want to trigger
   - Click on the workflow name

3. **Run Workflow**
   - Click **"Run workflow"** button
   - Select branch (usually `main`)
   - Click **"Run workflow"** to confirm

### Method 2: GitHub CLI

```bash
# Install GitHub CLI if not already installed
# https://cli.github.com/

# Trigger a workflow manually
gh workflow run "workflow-name.yml"

# Examples:
gh workflow run "01-intake.yml"
gh workflow run "validate-github-app.yml"

# Check workflow status
gh run list --workflow="workflow-name.yml"
```

### Method 3: REST API

```bash
# Trigger workflow via API
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  https://api.github.com/repos/OWNER/REPO/actions/workflows/WORKFLOW_ID/dispatches \
  -d '{"ref":"main"}'
```

## 🔍 Testing Checklist

### Before Running Tests

- [ ] All required secrets are configured
- [ ] Repository has proper permissions
- [ ] Configuration files exist (`.github/labels.yml`, etc.)
- [ ] Branch protection rules are properly set

### GitHub App Validation

```bash
# Run GitHub App validation
gh workflow run "validate-github-app.yml"

# Expected results:
# ✅ Token generation successful
# ✅ API access working
# ✅ Branded bot identity confirmed
```

### Slack Integration Testing

```bash
# Run Slack integration test
gh workflow run "validate-slack-integration.yml"

# Expected results:
# ✅ Basic message sent to Slack
# ✅ Rich message blocks working
# ✅ Bot appears with correct identity
```

### Labels Synchronization

```bash
# Run label sync validation
gh workflow run "validate-labels-sync.yml"

# Expected results:
# ✅ Label configuration valid
# ✅ All required labels present
# ✅ Color scheme accessibility confirmed
```

## 📊 Monitoring Workflow Results

### Check Workflow Status

```bash
# List recent workflow runs
gh run list --limit 10

# Get details of specific run
gh run view RUN_ID

# Download workflow logs
gh run download RUN_ID
```

### Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| **Token generation failed** | Verify `APP_ID` and `PRIVATE_KEY` secrets |
| **Slack message not sent** | Check `SLACK_BOT_TOKEN` and `SLACK_CHANNEL_ID` |
| **Label sync failed** | Validate `.github/labels.yml` syntax |
| **API rate limit exceeded** | Wait and retry, or use GitHub App token |
| **Permission denied** | Verify GitHub App permissions and installation |

## 🛠️ Troubleshooting

### Debug Mode

Enable debug logging by setting repository variables:
- `ACTIONS_STEP_DEBUG`: `true`
- `ACTIONS_RUNNER_DEBUG`: `true`

### Secrets Validation

Use the validation workflows to test each component:

1. **Start with GitHub App validation** - This tests the foundation
2. **Run Slack validation** - If notifications are needed
3. **Test label sync** - For repository organization
4. **Validate rulesets** - For branch protection

### Common Workflow Patterns

- **On Push**: Triggers CI, security, and quality workflows
- **On PR**: Triggers testing and validation workflows  
- **On Release**: Triggers release and notification workflows
- **On Schedule**: Triggers monitoring and maintenance workflows
- **Manual**: Triggers setup and validation workflows

## 📞 Getting Help

If workflows fail after following this guide:

1. Check workflow logs in the Actions tab
2. Verify all required secrets are set
3. Review configuration files for syntax errors
4. Test individual components using validation workflows
5. Check GitHub App permissions and installation

## 🔄 Regular Testing Schedule

Recommended testing schedule:

- **Weekly**: Run GitHub App validation
- **Monthly**: Test Slack integration (if used)
- **Before releases**: Run all validation workflows
- **After configuration changes**: Test affected workflows