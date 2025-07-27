# GitHub Pages Setup

Simple guide to enable GitHub Pages for your gem-ci repository documentation.

## Quick Setup

### 1. Enable GitHub Pages

1. Go to repository **Settings**
2. Scroll to **Pages** section
3. Under **Source**, select **Deploy from a branch**
4. Choose **Branch**: `master` or `main`
5. Choose **Folder**: `/ (root)` or `/docs`
6. Click **Save**

### 2. Configure Jekyll (if using /docs folder)

The repository already includes `docs/_config.yml`:

```yaml
title: gem-ci
description: Ruby gem continuous integration workflows
baseurl: "/gem-ci"
url: "https://your-username.github.io"

markdown: kramdown
highlighter: rouge
theme: minima

plugins:
  - jekyll-feed
  - jekyll-sitemap

exclude:
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor
```

### 3. Update Configuration

Edit `docs/_config.yml` with your details:

```yaml
title: Your Gem Name
description: Your gem description
baseurl: "/your-repo-name"
url: "https://your-username.github.io"
```

### 4. Access Your Site

After setup, your documentation will be available at:

```
https://your-username.github.io/your-repo-name/
```

## File Structure

The docs folder should look like:

```
docs/
├── _config.yml          # Jekyll configuration
├── index.md            # Homepage
├── guides/             # User guides
│   ├── gitflow.md
│   └── local-testing.md
├── setup/              # Setup instructions
│   ├── secrets.md
│   └── github-pages.md
├── workflows/          # Workflow documentation
│   └── overview.md
└── diagrams/           # Workflow diagrams
    └── ci-workflow-overview.md
```

## Custom Domain (Optional)

To use a custom domain:

1. Create `docs/CNAME` file with your domain:
   ```
   your-domain.com
   ```

2. Configure DNS with your domain provider:
   - Add CNAME record pointing to `your-username.github.io`

3. In repository Settings > Pages:
   - Enter your custom domain
   - Enable "Enforce HTTPS"

## Testing Locally

Install Jekyll to test locally:

```bash
# Install Jekyll
gem install jekyll bundler

# Navigate to docs folder
cd docs

# Create Gemfile if needed
bundle init
bundle add jekyll
bundle add minima

# Serve locally
bundle exec jekyll serve

# View at http://localhost:4000
```

## Troubleshooting

**Site not updating?**
- Check Actions tab for build errors
- Wait 5-10 minutes for changes to deploy
- Clear browser cache

**404 errors?**
- Verify baseurl in `_config.yml`
- Check file paths are correct
- Ensure markdown files have proper frontmatter

**Build failures?**
- Check Jekyll syntax in markdown files
- Verify all includes and layouts exist
- Review GitHub Actions logs

## Frontmatter Template

Add to the top of each markdown file:

```yaml
---
layout: default
title: Page Title
description: Page description
---
```

That's it! Your gem-ci documentation will be live on GitHub Pages.