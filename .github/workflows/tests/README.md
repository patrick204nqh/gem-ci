# 🧪 Validation Workflows

This folder contains validation workflows that test gem-ci setup, functionality, and template quality.

## 📁 Organization

- **Production Workflows**: Located in `../.github/workflows/` (01-08)
  - These are the core automation workflows
  - **These get copied by the gem-ci CLI tool**
  - Should use template variables for customization

- **Validation Workflows**: Located here in `tests/`
  - Used for validation and quality assurance
  - **Not copied by the CLI tool**
  - Help verify setup, functionality, and template quality

## 🧪 Current Validation Workflows

### `validate-github-app.yml`
- **Purpose**: Validates GitHub App setup and token generation
- **Trigger**: Manual (`workflow_dispatch`)
- **Validates**:
  - ✅ GitHub App token generation
  - 🌐 GitHub API access with generated token
  - 🤖 Branded bot identity verification
- **Required Secrets**:
  - `GEM_CI_APP_ID`
  - `GEM_CI_PRIVATE_KEY`

### `validate-slack-integration.yml`
- **Purpose**: Validates Slack notification functionality
- **Trigger**: Manual (`workflow_dispatch`)
- **Validates**:
  - 📢 Basic Slack message delivery
  - 🎨 Rich block message formatting
  - 🔄 Conditional notifications (success/failure)
  - 🤖 Branded bot appearance in Slack
- **Required Secrets**:
  - `GEM_CI_APP_ID` (for branded bot)
  - `GEM_CI_PRIVATE_KEY` (for branded bot)
  - `SLACK_BOT_TOKEN` (Slack bot token, not webhook URL)
  - `SLACK_CHANNEL_ID` (target channel ID)

### `validate-labels-sync.yml`
- **Purpose**: Validates label synchronization functionality
- **Trigger**: Manual (`workflow_dispatch`)
- **Validates**:
  - 🏷️ Labels configuration file structure (YAML/JSON)
  - 📋 YAML/JSON syntax and required fields
  - 🔄 Label sync mechanism (dry run)
  - 📊 Current repository labels audit
  - ✅ Standard open source labels presence
  - 🎨 Color scheme accessibility and consistency
- **Required Files**:
  - `.github/labels.yml` (preferred YAML format)
  - or `.github/config/labels.json` (legacy JSON format)

### `validate-repository-rulesets.yml`
- **Purpose**: Validates repository rulesets configuration
- **Trigger**: Manual (`workflow_dispatch`)
- **Validates**:
  - 🛡️ Ruleset configuration files
  - 📋 JSON structure and schema
  - 🔍 Current repository rulesets
  - 🔐 Repository permissions for management
  - ✅ Standard protection patterns
- **Required Files**:
  - `.github/config/rulesets/*.json` (recommended)
  - or `.github/rulesets.json` (alternative)

## 💡 Planned Validation Workflows

### `validate-template-variables.yml` (Planned)
- **Purpose**: Test template variable replacement
- **Validates**:
  - 🔄 All `{{VARIABLES}}` are properly replaced
  - 📝 Generated workflows have valid syntax
  - 🎯 No hardcoded gem-ci references remain

### `validate-workflow-execution.yml` (Planned)
- **Purpose**: Test that converted workflows actually work
- **Validates**:
  - ✅ All 8 workflows can execute successfully
  - 🔧 Required secrets and permissions work
  - 📊 Expected outputs are generated

### `validate-cli-tool.yml` (Planned)
- **Purpose**: Test the gem-ci CLI tool functionality
- **Validates**:
  - 📦 CLI tool can be installed
  - 🚀 `gem-ci init` works correctly
  - 🔄 `gem-ci update` functions properly
  - 📋 Template copying works as expected

### `validate-security-compliance.yml` (Planned)
- **Purpose**: Ensure security best practices
- **Validates**:
  - 🔒 No secrets leaked in workflows
  - 🛡️ Proper permission scoping
  - 🔐 GitHub App permissions are minimal
  - 🚨 Security scanning works correctly

### `validate-documentation.yml` (Planned)
- **Purpose**: Ensure documentation quality
- **Validates**:
  - 📚 All links work correctly
  - 📝 Markdown syntax is valid
  - 🎯 Examples match actual code
  - 📋 Setup guides are accurate

## 🚀 Usage

1. **Set up required secrets**:
   - `GEM_CI_APP_ID`
   - `GEM_CI_PRIVATE_KEY`
   - `SLACK_BOT_TOKEN` (for Slack tests)
   - `SLACK_CHANNEL_ID` (for Slack tests)

2. **Set up configuration files**:
   - `.github/labels.yml` (for label sync - preferred)
   - `.github/config/rulesets/*.json` (for rulesets)

3. **Run validations manually**:
   - Go to Actions tab in GitHub
   - Select the validation workflow you want to test
   - Click "Run workflow"

4. **Verify results**:
   - Check workflow logs for success/failure
   - Look for Slack notifications (if testing Slack integration)
   - Confirm branded bot appears in activity

## 📋 Adding New Validation Workflows

When adding new validation workflows:
- Place them in this `tests/` folder
- Use descriptive names with `validate-` prefix
- Follow the pattern: `validate-{component}.yml`
- Add documentation to this README
- Keep them separate from production workflows

### **Naming Convention**
- ✅ `validate-github-app.yml` - Tests GitHub App setup
- ✅ `validate-slack-integration.yml` - Tests Slack notifications
- ✅ `validate-labels-sync.yml` - Tests label synchronization
- ✅ `validate-repository-rulesets.yml` - Tests repository rulesets
- ✅ `validate-template-variables.yml` - Tests template conversion
- ✅ `validate-workflow-execution.yml` - Tests workflow functionality
- ✅ `validate-cli-tool.yml` - Tests CLI tool operations
- ✅ `validate-security-compliance.yml` - Tests security practices
- ✅ `validate-documentation.yml` - Tests documentation quality

## 🔐 Slack Bot Setup

For Slack integration testing, you'll need:

1. **Create a Slack App**:
   - Go to https://api.slack.com/apps
   - Create new app from scratch
   - Choose your workspace

2. **Configure Bot Permissions**:
   - Go to "OAuth & Permissions"
   - Add bot token scopes:
     - `chat:write` (send messages)
     - `chat:write.public` (send to public channels)

3. **Install App to Workspace**:
   - Install app to your workspace
   - Copy the "Bot User OAuth Token" (starts with `xoxb-`)

4. **Get Channel ID**:
   - Right-click on your target Slack channel
   - Select "Copy link"
   - Extract channel ID from URL (e.g., `C1234567890`)

5. **Add Secrets to Repository**:
   - `SLACK_BOT_TOKEN`: Your bot token (xoxb-...)
   - `SLACK_CHANNEL_ID`: Your channel ID (C...)

## 🏷️ Labels Configuration

The labels configuration file should use YAML format (`.github/labels.yml`):

```yaml
# Standard labels for open source projects
- name: "bug"
  color: "d73a4a"
  description: "Something isn't working"

- name: "enhancement"
  color: "a2eeef"
  description: "New feature or request"

# Priority Labels
- name: "priority: high"
  color: "d73a4a"
  description: "High priority issue"
```

**Key Features:**
- 🎨 **Semantic color scheme** with accessibility compliance
- 🏷️ **Standard open source labels** (bug, enhancement, documentation, etc.)
- 📊 **Priority system** (high, medium, low)
- 📏 **Size categories** (small, medium, large)  
- 🔧 **Type classification** (feature, bugfix, maintenance)
- 💎 **Ruby version labels** (for Ruby projects)
- 🖥️ **Platform labels** (Windows, macOS, Linux)

**Supports both formats:**
- `.github/labels.yml` (preferred YAML format)
- `.github/config/labels.json` (legacy JSON format)

## 🛡️ Repository Rulesets

Repository rulesets should be JSON files following GitHub's ruleset schema:

```json
{
  "name": "Branch Protection",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": {
      "include": ["refs/heads/main"],
      "exclude": []
    }
  },
  "rules": [
    {
      "type": "deletion"
    }
  ]
}
```

### **Import Instructions**
1. Go to repository Settings > Rules > Rulesets
2. Click "New ruleset" > "Import a ruleset"
3. Upload your JSON configuration files
4. Review and activate rulesets