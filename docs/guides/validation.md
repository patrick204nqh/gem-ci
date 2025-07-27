---
title: Validation Guide
description: Test, validate, and troubleshoot your gem-ci workflows and configuration
---

# ✅ Validation Guide

*Comprehensive testing and validation for your gem-ci workflows and configuration*

## 🎯 Overview

Before deploying gem-ci to production, it's essential to validate all components work correctly. This guide covers testing workflows, validating configuration, and troubleshooting common issues.

## 🧪 Workflow Validation

### **Local Testing with Act**

**Install and Setup**:
```bash
# Install act (GitHub Actions local runner)
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Test workflow locally
act -l  # List workflows
act -j test  # Run specific job
act push --secret-file .secrets  # Test push event
```

**Comprehensive Local Testing**:
```bash
# Test all major workflows
act push --secret-file .secrets  # CI, Security, Quality
act pull_request --secret-file .secrets  # PR workflows
act workflow_dispatch --secret-file .secrets  # Manual triggers
```

**See the complete [Local Testing Guide](local-testing) for detailed instructions.**

### **Test Workflows**

gem-ci includes validation workflows in `.github/workflows/tests/`:

#### **GitHub App Validation**
```yaml
# .github/workflows/tests/validate-github-app.yml
name: Validate GitHub App
on:
  workflow_dispatch:
  
jobs:
  validate-app:
    runs-on: ubuntu-latest
    steps:
      - name: Generate App Token
        id: app-token
        uses: actions/create-github-app-token@v1
        with:
          app-id: ${{ secrets.APP_ID }}
          private-key: ${{ secrets.PRIVATE_KEY }}
      
      - name: Test App Token
        run: |
          curl -H "Authorization: token ${{ steps.app-token.outputs.token }}" \
            https://api.github.com/repos/${{ github.repository }}
```

#### **Slack Integration Validation**
```yaml
# .github/workflows/tests/validate-slack-integration.yml
name: Validate Slack Integration
on:
  workflow_dispatch:

jobs:
  test-slack:
    runs-on: ubuntu-latest
    steps:
      - name: Send test message
        uses: slackapi/slack-github-action@v1.27.0
        with:
          channel-id: ${{ secrets.SLACK_CHANNEL_ID }}
          payload: |
            {
              "text": "🧪 Test message from gem-ci validation",
              "blocks": [
                {
                  "type": "section",
                  "text": {
                    "type": "mrkdwn", 
                    "text": "This is a test message to validate Slack integration is working correctly."
                  }
                }
              ]
            }
        env:
          SLACK_BOT_TOKEN: ${{ secrets.SLACK_BOT_TOKEN }}
```

#### **Label Sync Validation**
```yaml
# .github/workflows/tests/validate-labels-sync.yml
name: Validate Labels Sync
on:
  workflow_dispatch:

jobs:
  test-labels:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Validate labels config
        run: |
          # Check labels.yml syntax
          python -c "import yaml; yaml.safe_load(open('.github/config/labels.yml'))"
          
      - name: Sync labels (dry run)
        uses: crazy-max/ghaction-github-labeler@v5
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          yaml-file: .github/config/labels.yml
          dry-run: true
```

### **Running Validation Tests**

**Manual Trigger**:
```bash
# Trigger validation workflows manually
gh workflow run validate-github-app.yml
gh workflow run validate-slack-integration.yml  
gh workflow run validate-labels-sync.yml
```

**Batch Validation Script**:
```bash
#!/bin/bash
# scripts/validate-all.sh

echo "🧪 Running all validation tests..."

# Test GitHub App
echo "Testing GitHub App integration..."
gh workflow run validate-github-app.yml
sleep 5

# Test Slack integration
echo "Testing Slack integration..."
gh workflow run validate-slack-integration.yml
sleep 5

# Test label sync
echo "Testing label synchronization..."
gh workflow run validate-labels-sync.yml

echo "✅ All validation tests triggered. Check Actions tab for results."
```

## 🔧 Configuration Validation

### **YAML Syntax Validation**

**Validate All Configuration Files**:
```bash
#!/bin/bash
# scripts/validate-config.sh

echo "🔍 Validating configuration files..."

# Validate workflow YAML files
for file in .github/workflows/*.yml; do
  echo "Checking $file..."
  if ! yaml-lint "$file"; then
    echo "❌ Invalid YAML: $file"
    exit 1
  fi
done

# Validate config files
for file in .github/config/*.yml .github/config/*.yaml; do
  if [ -f "$file" ]; then
    echo "Checking $file..."
    if ! yaml-lint "$file"; then
      echo "❌ Invalid YAML: $file"
      exit 1
    fi
  fi
done

echo "✅ All configuration files are valid"
```

### **Secrets Validation**

**Check Required Secrets**:
```bash
#!/bin/bash
# scripts/validate-secrets.sh

REQUIRED_SECRETS=(
  "APP_ID"
  "PRIVATE_KEY"
)

OPTIONAL_SECRETS=(
  "SLACK_BOT_TOKEN"
  "SLACK_CHANNEL_ID"
  "RUBYGEMS_API_KEY"
)

echo "🔐 Validating repository secrets..."

# Check if secrets exist (via API)
for secret in "${REQUIRED_SECRETS[@]}"; do
  if gh secret list | grep -q "$secret"; then
    echo "✅ Required secret '$secret' is configured"
  else
    echo "❌ Missing required secret: '$secret'"
    exit 1
  fi
done

for secret in "${OPTIONAL_SECRETS[@]}"; do
  if gh secret list | grep -q "$secret"; then
    echo "✅ Optional secret '$secret' is configured"
  else
    echo "⚠️  Optional secret '$secret' is not configured"
  fi
done

echo "✅ Secret validation complete"
```

### **Repository Settings Validation**

**Validate Branch Protection**:
```bash
#!/bin/bash
# scripts/validate-branch-protection.sh

BRANCH="main"  # or "master"

echo "🛡️  Validating branch protection for '$BRANCH'..."

# Check branch protection status
PROTECTION=$(gh api repos/$GITHUB_REPOSITORY/branches/$BRANCH/protection 2>/dev/null || echo "none")

if [ "$PROTECTION" = "none" ]; then
  echo "⚠️  Branch protection not enabled for '$BRANCH'"
  echo "Consider enabling branch protection rules"
else
  echo "✅ Branch protection is enabled for '$BRANCH'"
fi
```

## 🐛 Troubleshooting Common Issues

### **Workflow Failures**

#### **GitHub App Authentication Issues**

**Symptoms**:
```
Error: Bad credentials
Error: Resource not accessible by integration
```

**Diagnosis**:
```bash
# Test app authentication
gh auth status
gh api user  # Should work with personal token

# Test app token generation locally
echo "$PRIVATE_KEY" | base64 -d > private-key.pem
# Use GitHub CLI or API to test app authentication
```

**Solutions**:
1. Verify `APP_ID` is correct (numeric value)
2. Check `PRIVATE_KEY` format (includes BEGIN/END lines)
3. Ensure app is installed on repository
4. Verify app permissions are sufficient

#### **Slack Integration Issues**

**Symptoms**:
```
Error: channel_not_found
Error: invalid_auth
```

**Diagnosis**:
```bash
# Test Slack webhook manually
curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"Test message"}' \
  $SLACK_WEBHOOK_URL

# Verify bot token format
echo $SLACK_BOT_TOKEN | cut -c1-10  # Should be "xoxb-XXXXX"
```

**Solutions**:
1. Verify `SLACK_BOT_TOKEN` starts with `xoxb-`
2. Check `SLACK_CHANNEL_ID` format (e.g., `C1234567890`)
3. Ensure bot has `chat:write` permission
4. Verify bot is added to the target channel

#### **Dependency Issues**

**Symptoms**:
```
Error: Could not find gem 'xyz'
Error: Bundler version mismatch
```

**Diagnosis**:
```bash
# Check Gemfile.lock
git status Gemfile.lock

# Verify bundle install locally
bundle install --verbose

# Check for platform-specific gems
bundle lock --add-platform x86_64-linux
```

**Solutions**:
1. Update Gemfile.lock: `bundle install`
2. Add platform constraints: `bundle lock --add-platform`
3. Pin problematic gem versions
4. Clear bundle cache: `bundle clean --force`

### **Performance Issues**

#### **Slow Workflow Execution**

**Diagnosis**:
```bash
# Analyze workflow timing
gh run list --limit 10 --json conclusion,createdAt,updatedAt,name

# Check individual job timing
gh run view $RUN_ID --json jobs
```

**Optimization Strategies**:
1. **Parallel Jobs**: Run independent jobs concurrently
2. **Caching**: Implement proper dependency caching
3. **Matrix Reduction**: Limit Ruby versions/platforms
4. **Conditional Steps**: Skip unnecessary steps

**Example Optimization**:
```yaml
# Before: Sequential execution
jobs:
  lint:
    runs-on: ubuntu-latest
    steps: [...]
  
  test:
    runs-on: ubuntu-latest
    needs: lint  # ❌ Unnecessary dependency
    steps: [...]

# After: Parallel execution  
jobs:
  lint:
    runs-on: ubuntu-latest
    steps: [...]
    
  test:
    runs-on: ubuntu-latest  # ✅ Runs in parallel
    steps: [...]
```

#### **High GitHub Actions Costs**

**Cost Analysis**:
```bash
# Check Actions usage
gh api repos/$GITHUB_REPOSITORY/actions/billing

# Analyze workflow efficiency
gh run list --json name,conclusion,createdAt,updatedAt \
  | jq '.[] | {name: .name, duration: (.updatedAt | fromdateiso8601) - (.createdAt | fromdateiso8601)}'
```

**Cost Reduction Strategies**:
1. **Single Ruby Version**: Use only Ruby 3.3
2. **Ubuntu Only**: Avoid macOS/Windows runners
3. **Reduced Schedules**: Change daily to weekly
4. **Focused Linting**: Replace super-linter with targeted linting

### **Integration Issues**

#### **Release Automation Problems**

**Symptoms**:
```
Error: No release PR found
Error: Version bump failed
Error: RubyGems push failed
```

**Diagnosis**:
```bash
# Check release-please configuration
cat .github/config/release-please-config.json

# Verify version file format
cat lib/your_gem/version.rb

# Test gem build manually
gem build *.gemspec
```

**Solutions**:
1. Verify release-please configuration
2. Check version file format
3. Ensure conventional commit format
4. Validate RubyGems API key permissions

#### **Documentation Generation Issues**

**Symptoms**:
```
Error: YARD documentation failed
Error: Jekyll build failed
```

**Diagnosis**:
```bash
# Test YARD locally
bundle exec yard doc --debug

# Test Jekyll build
cd docs && bundle exec jekyll build --verbose
```

**Solutions**:
1. Fix YARD documentation syntax
2. Validate Jekyll configuration
3. Check file permissions
4. Verify all referenced files exist

## 📋 Validation Checklist

### **Pre-deployment Validation**

**Configuration**:
- [ ] All YAML files are syntactically valid
- [ ] Required secrets are configured
- [ ] GitHub App is created and installed
- [ ] Repository settings are configured

**Functionality**:
- [ ] GitHub App authentication works
- [ ] Slack integration sends messages (if used)
- [ ] Label synchronization works
- [ ] CI workflows execute successfully
- [ ] Security scans complete without errors

**Performance**:
- [ ] Workflow execution times are acceptable
- [ ] GitHub Actions costs are within budget
- [ ] Parallel jobs execute efficiently
- [ ] Caching reduces execution time

### **Post-deployment Monitoring**

**Health Checks**:
- [ ] All workflows execute successfully
- [ ] Notifications are delivered correctly
- [ ] Release automation works
- [ ] Documentation builds and deploys

**Performance Monitoring**:
- [ ] Workflow success rates > 95%
- [ ] Average execution times within targets
- [ ] GitHub Actions costs within budget
- [ ] No recurring failure patterns

## 🔄 Continuous Validation

### **Automated Health Checks**

**Daily Health Check**:
```yaml
# .github/workflows/health-check.yml
name: Daily Health Check
on:
  schedule:
    - cron: '0 9 * * *'  # Daily at 9 AM UTC

jobs:
  health-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Validate configuration
        run: ./scripts/validate-config.sh
        
      - name: Check workflow success rates
        run: ./scripts/check-workflow-health.sh
        
      - name: Send health report
        if: failure()
        uses: slackapi/slack-github-action@v1.27.0
        # ... send alert
```

### **Regression Testing**

**Test Changes Before Merge**:
```yaml
# Add to PR workflows
- name: Validate workflow changes
  if: contains(github.event.pull_request.changed_files, '.github/workflows/')
  run: |
    # Test workflow syntax
    act --list
    
    # Validate configuration
    ./scripts/validate-config.sh
```

## 🚀 Advanced Validation

### **Load Testing**

**Stress Test Workflows**:
```bash
#!/bin/bash
# scripts/stress-test.sh

echo "🚀 Running workflow stress test..."

# Trigger multiple workflow runs
for i in {1..10}; do
  gh workflow run ci.yml
  sleep 30  # Avoid rate limiting
done

echo "Monitor Actions tab for performance under load"
```

### **Chaos Engineering**

**Test Failure Scenarios**:
```yaml
# Test workflow resilience
- name: Chaos test - Random failure
  run: |
    if [ $((RANDOM % 10)) -eq 0 ]; then
      echo "Simulating random failure"
      exit 1
    fi
    echo "Normal execution"
```

## 💡 Best Practices

### **Validation Strategy**

1. **Layer Validation**: Test at multiple levels (syntax, functionality, integration)
2. **Automate Checks**: Use scripts and workflows for consistent validation
3. **Monitor Continuously**: Don't just validate once, monitor ongoing health
4. **Document Issues**: Keep a log of common issues and solutions

### **Testing Approach**

1. **Start Local**: Always test locally with act before deploying
2. **Validate Incrementally**: Test individual components before full integration
3. **Use Feature Branches**: Test workflow changes in separate branches
4. **Maintain Test Environment**: Keep a test repository for experimenting

### **Error Handling**

1. **Graceful Degradation**: Ensure workflows continue with non-critical failures
2. **Clear Error Messages**: Provide actionable error messages
3. **Fallback Mechanisms**: Have backup procedures for critical processes
4. **Recovery Procedures**: Document how to recover from common failures

---

**Ready to validate your setup?** Start with local testing using act, then run the validation workflows to ensure everything works correctly!