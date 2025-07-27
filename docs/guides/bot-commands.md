---
title: Bot Commands Guide  
description: Interactive bot commands for workflow management and automation control
---

# 🤖 Bot Commands Guide

*Control your gem-ci workflows interactively through GitHub comments*

## 🎯 Overview

gem-ci includes an interactive bot system that allows you to control workflows through GitHub issue and PR comments. Commands are triggered by commenting with `/gem-ci` followed by specific actions.

## 📋 Available Commands

### **Help Command**

Get list of available commands:

```
/gem-ci help
```

**Response**: Bot will reply with all available commands and their usage.

---

### **Release Management**

#### **Revise Release Type**

Change the type of the next release:

```
/gem-ci revise release [from] to [to]
```

**Examples**:
```
/gem-ci revise release minor to patch
/gem-ci revise release major to minor  
/gem-ci revise release patch to minor
```

**Supported Release Types**:
- `patch` - Bug fixes (1.0.0 → 1.0.1)
- `minor` - New features (1.0.0 → 1.1.0)  
- `major` - Breaking changes (1.0.0 → 2.0.0)

---

#### **Cancel Release**

Cancel the current release PR:

```
/gem-ci cancel release
```

**Effect**: Closes the current release-please PR and prevents automatic release.

---

### **Workflow Control**

#### **Trigger CI** (Coming Soon)

Manually trigger CI workflows:

```
/gem-ci run ci
/gem-ci run security
/gem-ci run quality
```

#### **Skip CI** (Coming Soon)

Skip specific CI checks:

```
/gem-ci skip ci
/gem-ci skip linting
```

## 🚀 Usage Examples

### **Scenario 1: Downgrade Release Type**

You created a feature but realized it's just a bug fix:

```markdown
# In PR or issue comment
/gem-ci revise release minor to patch

# Bot responds with:
✅ Release type changed from minor to patch for the next release
```

### **Scenario 2: Emergency Release Cancellation**

You need to stop a release that's in progress:

```markdown
# In release PR comment  
/gem-ci cancel release

# Bot responds with:
🛑 Release cancelled. The release PR will be closed.
```

### **Scenario 3: Get Available Commands**

Not sure what commands are available:

```markdown
# In any issue or PR
/gem-ci help

# Bot responds with full command list
```

## 🔧 Command Syntax

### **General Format**

```
/gem-ci <command> [arguments]
```

**Rules**:
- Commands are case-insensitive
- Must start with `/gem-ci` 
- Can be anywhere in a comment
- One command per comment
- Supports emoji reactions for acknowledgment

### **Argument Patterns**

**Release Type Changes**:
```
/gem-ci revise release <current-type> to <new-type>
```

**Simple Commands**:
```
/gem-ci <action>
```

## 📊 Bot Responses

### **Success Responses**

Bot indicates successful command execution:

```markdown
✅ Command executed successfully
🔄 Workflow triggered  
📝 Configuration updated
🎯 Release type changed
```

### **Error Responses**

Bot provides helpful error messages:

```markdown
❌ Invalid command syntax
⚠️ Command not recognized
🚫 Insufficient permissions
📋 Missing required arguments
```

### **Help Responses**

Bot provides detailed help:

```markdown
🤖 **gem-ci Bot Commands**

**Release Management:**
• `/gem-ci revise release [from] to [to]` - Change release type
• `/gem-ci cancel release` - Cancel current release

**General:**
• `/gem-ci help` - Show this help message

*Commands are case-insensitive and can be used in any issue or PR comment.*
```

## 🔐 Permissions & Security

### **Who Can Use Commands**

- **Repository collaborators** with write access
- **PR authors** for their own PRs
- **Issue authors** for their own issues
- **Repository admins** for all commands

### **Security Features**

- **Permission checking**: Validates user permissions before execution
- **Audit logging**: All commands are logged in workflow runs
- **Rate limiting**: Prevents command spam
- **Validation**: Input validation prevents malicious commands

## 🛠️ Implementation Details

### **Workflow Integration**

Commands are processed by `.github/workflows/09-bot-commands.yml`:

```yaml
name: 09 - Bot Commands
on:
  issue_comment:
    types: [created]
  
jobs:
  process-command:
    if: contains(github.event.comment.body, '/gem-ci')
    runs-on: ubuntu-latest
    steps:
      - name: Process bot command
        uses: actions/github-script@v7
        # ... command processing logic
```

### **Command Processing**

1. **Trigger Detection**: Comment contains `/gem-ci`
2. **Permission Check**: Validate user has required permissions  
3. **Command Parsing**: Extract command and arguments
4. **Action Execution**: Execute the requested action
5. **Response**: Reply with success/error message
6. **Audit**: Log command execution

## 🎨 Customization

### **Adding New Commands**

Extend the bot with custom commands:

```javascript
// In .github/workflows/09-bot-commands.yml
const customCommands = {
  'deploy': async (args) => {
    // Custom deployment logic
    return '🚀 Deployment triggered';
  },
  
  'benchmark': async (args) => {
    // Custom benchmark logic  
    return '📊 Benchmark started';
  }
};
```

### **Custom Response Messages**

Customize bot responses:

```javascript
const responses = {
  success: '✅ Command executed successfully',
  error: '❌ Command failed',
  unauthorized: '🚫 You don\'t have permission for this command',
  help: generateHelpMessage()
};
```

## 📈 Command Analytics

### **Usage Tracking**

Monitor command usage through workflow runs:

- **Most used commands**: Track popular bot features
- **Error rates**: Monitor command success rates  
- **User adoption**: See who's using bot commands
- **Performance**: Track command execution times

### **Metrics Available**

```yaml
# Tracked automatically in workflow runs
command_type: "revise_release"
user: "username"
execution_time: "2.3s"
success: true
repository: "owner/repo"
```

## 🚨 Troubleshooting

### **Common Issues**

**Command not recognized:**
```
❌ Unknown command: '/gem-ci invalid'
💡 Try '/gem-ci help' for available commands
```

**Solution**: Check command spelling and available commands.

**Permission denied:**
```
🚫 You don't have permission to execute this command
```

**Solution**: Ensure you have write access to the repository.

**Command failed:**
```
❌ Failed to revise release: No release PR found
```

**Solution**: Ensure there's an active release PR to modify.

### **Debug Information**

Enable debug mode for troubleshooting:

```markdown
# Add to any command for verbose output
/gem-ci help --debug
```

## 🔄 Integration with Workflows

### **Release Workflow Integration**

Bot commands integrate with release-please:

```yaml
# .github/workflows/06-release.yml
- name: Check for bot commands
  if: contains(github.event.comment.body, '/gem-ci revise release')
  # ... release modification logic
```

### **CI Workflow Integration**

Commands can trigger CI workflows:

```yaml
# .github/workflows/02-ci.yml  
- name: Manual CI trigger
  if: contains(github.event.comment.body, '/gem-ci run ci')
  # ... CI execution logic
```

## 💡 Best Practices

### **Command Usage**

- **Clear intent**: Use commands for specific, well-defined actions
- **Documentation**: Comment why you're using a command
- **Testing**: Test commands in development branches first
- **Permissions**: Ensure team knows who can use commands

### **Command Design**

- **Intuitive syntax**: Make commands easy to remember
- **Helpful errors**: Provide clear error messages
- **Confirmation**: Confirm destructive actions
- **Logging**: Log all command executions

## 🚀 Future Enhancements

### **Planned Features**

- **Workflow control**: Start/stop specific workflows
- **Configuration updates**: Modify workflow settings via commands
- **Batch operations**: Execute multiple commands together
- **Scheduled commands**: Schedule commands for later execution
- **Command templates**: Save commonly used command combinations

### **Advanced Features**

- **Natural language**: Accept more natural command syntax
- **Context awareness**: Commands adapt based on PR/issue context  
- **Integration hooks**: Connect with external services
- **Command history**: Track and repeat previous commands

---

**Ready to use bot commands?** Start with `/gem-ci help` in any issue or PR comment to see what's available!