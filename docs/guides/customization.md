---
title: Customization Guide
description: Customize and extend gem-ci workflows for your specific project needs
---

# 🎯 Customization Guide

*Adapt and extend gem-ci workflows to fit your specific project requirements*

## 🏗️ Workflow Customization

### **Modifying Ruby Versions**

By default, gem-ci uses Ruby 3.3 for cost optimization. To support multiple versions:

```yaml
# In .github/workflows/02-ci.yml
strategy:
  matrix:
    ruby-version: 
      - '3.1'
      - '3.2'
      - '3.3'
    os: [ubuntu-latest]  # Keep single OS for cost control
```

### **Adding Test Frameworks**

gem-ci supports multiple test frameworks:

```yaml
# For Minitest
- name: Run tests
  run: |
    bundle exec ruby -Itest test/**/*_test.rb
    
# For RSpec (default)
- name: Run tests  
  run: bundle exec rspec

# For both
- name: Run tests
  run: |
    if [ -f "spec/spec_helper.rb" ]; then
      bundle exec rspec
    elif [ -d "test" ]; then
      bundle exec ruby -Itest test/**/*_test.rb
    fi
```

### **Custom Linting Rules**

Extend the linting configuration:

```yaml
# .rubocop.yml
AllCops:
  TargetRubyVersion: 3.3
  NewCops: enable
  Exclude:
    - 'vendor/**/*'
    - 'tmp/**/*'

# Your custom rules
Style/Documentation:
  Enabled: false

Metrics/BlockLength:
  Exclude:
    - 'spec/**/*'
```

## 🔧 Environment Configuration

### **Custom Environment Variables**

Add project-specific variables to workflows:

```yaml
# In workflow files
env:
  CUSTOM_VAR: "your-value"
  DATABASE_URL: "sqlite3::memory:"
  RAILS_ENV: test
```

### **Conditional Steps**

Add conditional logic for different scenarios:

```yaml
# Only run on specific branches
- name: Deploy to staging
  if: github.ref == 'refs/heads/develop'
  run: deploy-staging.sh

# Only for specific file changes
- name: Run database migrations
  if: contains(github.event.head_commit.modified, 'db/migrate')
  run: bundle exec rails db:migrate
```

## 📊 Custom Workflows

### **Adding New Workflows**

Create custom workflows for specific needs:

```yaml
# .github/workflows/custom-deployment.yml
name: Custom Deployment
on:
  release:
    types: [published]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to production
        run: |
          # Your deployment logic
```

### **Integration Workflows**

Add integrations with external services:

```yaml
# .github/workflows/integration-tests.yml
name: Integration Tests
on:
  pull_request:
    paths: ['lib/**', 'spec/integration/**']

jobs:
  integration:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v4
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: 3.3
          bundler-cache: true
      - name: Run integration tests
        run: bundle exec rspec spec/integration
```

## 🎨 Branding Customization

### **Bot Name and Avatar**

Update GitHub App settings to customize:

1. **App Name**: Change from `gem-ci[bot]` to `your-project[bot]`
2. **Avatar**: Upload your project logo
3. **Description**: Update app description

### **Notification Templates**

Customize Slack notification messages:

```yaml
# In notification workflows
- name: Send Slack notification
  uses: slackapi/slack-github-action@v1.27.0
  with:
    channel-id: ${{ secrets.SLACK_CHANNEL_ID }}
    payload: |
      {
        "text": "🚀 Release ${{ github.event.release.tag_name }}",
        "blocks": [
          {
            "type": "section",
            "text": {
              "type": "mrkdwn",
              "text": "*${{ github.repository }}* released version `${{ github.event.release.tag_name }}`"
            }
          }
        ]
      }
```

## 🏷️ Label Customization

### **Custom Labels**

Modify `.github/config/labels.yml`:

```yaml
# Custom priority labels
- name: "priority: critical"
  color: "d73a4a"
  description: "Critical priority issue"

- name: "priority: high"
  color: "ff6b35"
  description: "High priority issue"

# Custom type labels  
- name: "type: enhancement"
  color: "84b6eb"
  description: "New feature or request"

- name: "type: documentation"
  color: "0052cc"
  description: "Documentation improvements"
```

### **Auto-labeling Rules**

Customize `.github/config/labeler.yml`:

```yaml
# Custom labeling based on file paths
"type: frontend":
  - "app/assets/**/*"
  - "app/javascript/**/*"

"type: backend":
  - "app/controllers/**/*"
  - "app/models/**/*"
  - "lib/**/*"

"type: tests":
  - "spec/**/*"
  - "test/**/*"

# Size-based labeling (custom sizes)
"size: tiny":
  - "*.md"
  - "*.txt"
```

## 🔐 Security Customization

### **Custom Security Policies**

Create `.github/SECURITY.md`:

```markdown
# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| 0.x.x   | :x:                |

## Reporting Vulnerabilities

Email security issues to: security@yourproject.com
```

### **CodeQL Configuration**

Customize `.github/config/codeql.yml`:

```yaml
name: "Custom CodeQL"
disable-default-queries: false
queries:
  - uses: security-and-quality
  - uses: ./custom-queries/ruby-specific.ql

paths:
  - lib/
  - app/
paths-ignore:
  - spec/
  - test/
```

## 📦 Dependency Management

### **Custom Dependabot Configuration**

Enhance `.github/dependabot.yml`:

```yaml
version: 2
updates:
  # Ruby dependencies
  - package-ecosystem: "bundler"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    open-pull-requests-limit: 5
    groups:
      development:
        patterns:
          - "rspec*"
          - "factory_bot*"
          - "rubocop*"
      
  # GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "monthly"
    groups:
      actions:
        patterns:
          - "*"
```

### **Version Pinning Strategy**

Choose your dependency update strategy:

```ruby
# Gemfile - Conservative approach
gem 'rails', '~> 7.0.0'
gem 'rspec-rails', '~> 6.0'

# Or more flexible
gem 'rails', '>= 7.0', '< 8.0'
gem 'rspec-rails', '>= 6.0'
```

## 🚀 Release Customization

### **Custom Release Types**

Modify release-please configuration:

```json
// .github/config/release-please-config.json
{
  "release-type": "ruby",
  "packages": {
    ".": {
      "changelog-sections": [
        {"type": "feat", "section": "Features"},
        {"type": "fix", "section": "Bug Fixes"},
        {"type": "perf", "section": "Performance"},
        {"type": "docs", "section": "Documentation"},
        {"type": "deps", "section": "Dependencies"}
      ],
      "version-file": "lib/your_gem/version.rb"
    }
  }
}
```

### **Post-Release Actions**

Add custom post-release steps:

```yaml
# In .github/workflows/06-release.yml
- name: Update package managers
  if: steps.release.outputs.release_created
  run: |
    # Update Homebrew formula
    curl -X POST \
      -H "Authorization: token ${{ secrets.HOMEBREW_TOKEN }}" \
      -d '{"event_type":"gem-update","client_payload":{"version":"${{ steps.release.outputs.tag_name }}"}}' \
      https://api.github.com/repos/youruser/homebrew-tap/dispatches
```

## 📊 Monitoring Customization

### **Custom Metrics**

Add project-specific monitoring:

```yaml
# .github/workflows/custom-monitoring.yml
- name: Check gem download stats
  run: |
    DOWNLOADS=$(curl -s "https://rubygems.org/api/v1/gems/${{ github.event.repository.name }}.json" | jq .downloads)
    echo "Total downloads: $DOWNLOADS"
    # Send to monitoring service
```

### **Performance Benchmarks**

Add performance tracking:

```yaml
- name: Run benchmarks
  run: |
    bundle exec ruby benchmark/performance.rb > benchmark-results.txt
    # Compare with previous results
    # Fail if performance regression > 10%
```

## 🧪 Testing Customization

### **Multi-Database Testing**

Test against multiple databases:

```yaml
strategy:
  matrix:
    database: [sqlite, postgresql, mysql]
    include:
      - database: postgresql
        database_url: "postgresql://postgres:postgres@localhost:5432/test"
      - database: mysql
        database_url: "mysql2://root:password@127.0.0.1:3306/test"
services:
  postgres:
    image: postgres:15
    # ... postgres config
  mysql:
    image: mysql:8.0
    # ... mysql config
```

### **Browser Testing**

Add Selenium testing for gems with web components:

```yaml
- name: Setup Chrome
  uses: browser-actions/setup-chrome@latest
- name: Run browser tests
  run: |
    export CHROME_BIN=$(which chrome)
    bundle exec rspec spec/system
```

## 📚 Documentation Customization

### **Custom Jekyll Theme**

Switch from Cayman to a custom theme:

```yaml
# docs/_config.yml
remote_theme: username/your-custom-theme
# or
theme: minima

# Custom styling
sass:
  sass_dir: _sass
  style: compressed
```

### **API Documentation**

Enhance YARD documentation:

```ruby
# .yardopts
--markup markdown
--markup-provider kramdown
--output-dir docs/api
--protected
--private
lib/**/*.rb
```

## 🔄 Advanced Workflows

### **Matrix Builds with Exclusions**

Optimize CI matrix builds:

```yaml
strategy:
  fail-fast: false
  matrix:
    ruby: ['3.1', '3.2', '3.3']
    os: [ubuntu-latest, macos-latest]
    experimental: [false]
    include:
      - ruby: 'head'
        os: ubuntu-latest
        experimental: true
    exclude:
      - ruby: '3.1'
        os: macos-latest  # Skip expensive combinations
  continue-on-error: ${{ matrix.experimental }}
```

### **Workflow Orchestration**

Create dependencies between workflows:

```yaml
# .github/workflows/deploy.yml
on:
  workflow_run:
    workflows: ["CI", "Security", "Quality"]
    types: [completed]
    branches: [main]
    
jobs:
  deploy:
    if: github.event.workflow_run.conclusion == 'success'
    # ... deployment steps
```

## 💡 Best Practices

### **Gradual Adoption**

1. **Start Small**: Begin with basic CI/CD
2. **Add Incrementally**: Add workflows one at a time
3. **Monitor Costs**: Track GitHub Actions usage
4. **Team Training**: Ensure team understands workflows

### **Maintenance Strategy**

1. **Regular Reviews**: Monthly workflow performance reviews
2. **Version Updates**: Keep actions and dependencies current
3. **Cost Monitoring**: Review GitHub Actions usage monthly
4. **Documentation**: Keep customizations documented

### **Testing Customizations**

```bash
# Test workflow changes locally with act
act -W .github/workflows/your-custom-workflow.yml --secret-file .secrets

# Validate workflow syntax
gh workflow view your-custom-workflow.yml
```

## 🚨 Common Pitfalls

### **Avoid These Mistakes**

❌ **Over-customization**: Don't modify every aspect initially  
❌ **Ignoring costs**: Monitor GitHub Actions usage  
❌ **Breaking changes**: Test customizations thoroughly  
❌ **Poor documentation**: Document all customizations  
❌ **Security gaps**: Maintain security standards  

✅ **Best Approach**: Customize gradually, test thoroughly, document changes

---

Need help with customization? Check our [troubleshooting guide](validation) or [open an issue](https://github.com/patrick204nqh/gem-ci/issues) for support.