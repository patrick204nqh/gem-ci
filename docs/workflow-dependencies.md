---
title: Workflow Dependencies
description: Visual representation of workflow dependencies
---

# 🔗 Workflow Dependencies

<div class="diagram-container">
<div class="diagram-title">GitHub Actions Workflow Dependencies</div>
<div class="diagram-description">Shows how different workflows depend on tokens and integrations</div>

<div class="mermaid">
graph TD
    A[GitHub App Token] --> B[01-Intake]
    A --> C[03-Security]
    A --> D[04-Quality]
    A --> E[05-Community]
    A --> F[06-Release]
    A --> G[09-Bot Commands]
    
    H[Slack Integration] --> I[Notifications]
    J[RubyGems Token] --> F
    
    K[02-CI Results] --> L[PR Dashboard]
    M[03-Security Results] --> L
    N[04-Quality Results] --> L
</div>

</div>

## How to Use Simple Mermaid

Instead of complex plugins, just use:

```html
<div class="mermaid">
your mermaid code here
</div>
```

## Download Diagram

You can right-click on any rendered diagram and select "Save image as..." to download it, or use browser developer tools to export the SVG.