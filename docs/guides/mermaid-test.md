---
title: Mermaid Diagram Test
description: Test page for Mermaid diagram functionality
---

# 🧪 Mermaid Diagram Test

This page demonstrates Mermaid diagram functionality in our documentation.

## Simple Flowchart

<div class="diagram-container">
<div class="diagram-title">Sample Workflow Process</div>
<div class="diagram-description">Basic flowchart showing a simple decision process</div>

<div class="mermaid">
flowchart TD
    A[Start] --> B{Decision?}
    B -->|Yes| C[Process A]
    B -->|No| D[Process B]
    C --> E[End]
    D --> E[End]
</div>

</div>

## Git Flow Diagram

<div class="diagram-container">
<div class="diagram-title">Git Workflow</div>
<div class="diagram-description">Example GitFlow branching model</div>

<div class="mermaid">
gitGraph
    commit id: "Initial"
    branch develop
    checkout develop
    commit id: "Setup"
    
    branch feature/auth
    checkout feature/auth
    commit id: "Add login"
    commit id: "Add tests"
    
    checkout develop
    merge feature/auth
    commit id: "Merge auth"
    
    checkout main
    merge develop
    commit id: "Release v1.0"
</div>

</div>

## Sequence Diagram

<div class="diagram-container">
<div class="diagram-title">CI/CD Process</div>
<div class="diagram-description">Sequence diagram showing CI/CD workflow interactions</div>

<div class="mermaid">
sequenceDiagram
    participant Dev as Developer
    participant GH as GitHub
    participant CI as CI Pipeline
    participant Slack as Slack
    
    Dev->>GH: Push code
    GH->>CI: Trigger workflow
    CI->>CI: Run tests
    CI->>CI: Build gem
    CI->>GH: Update status
    CI->>Slack: Send notification
    Slack->>Dev: Notify result
</div>

</div>

## Testing Instructions

1. **View this page**: The diagrams should render automatically
2. **Check responsiveness**: Resize browser to test mobile view
3. **Verify styling**: Diagrams should have proper borders and spacing

If diagrams don't render, check:
- JavaScript console for Mermaid errors
- Network tab to ensure Mermaid.js loads
- Browser compatibility (modern browsers required)