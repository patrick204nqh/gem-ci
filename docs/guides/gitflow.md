# GitFlow Guide for gem-ci

This guide explains the Git workflow and branching strategy used in gem-ci projects.

## Overview

gem-ci follows a simplified GitFlow model optimized for Ruby gem development with automated CI/CD integration.

📊 **Visual Guide**: See the [GitFlow Diagram](../diagrams/gitflow-diagram.md) for a visual representation of this workflow.

## Branch Structure

### Main Branches

- **`master`** - Production-ready releases
  - Always deployable
  - Protected with required status checks
  - All commits must be signed
  - Requires pull request reviews

- **`develop`** - Integration branch for features
  - Latest development changes
  - Automatically tested on push
  - Base branch for feature development

### Supporting Branches

- **`feature/*`** - New features and enhancements
  - Branch from: `develop`
  - Merge back to: `develop`
  - Naming: `feature/description` or `feature/issue-number`

- **`bugfix/*`** - Bug fixes for development
  - Branch from: `develop` 
  - Merge back to: `develop`
  - Naming: `bugfix/description` or `bugfix/issue-number`

- **`hotfix/*`** - Critical production fixes
  - Branch from: `master`
  - Merge back to: `master` and `develop`
  - Naming: `hotfix/version` or `hotfix/critical-fix`

- **`release/*`** - Release preparation
  - Branch from: `develop`
  - Merge back to: `master` and `develop`
  - Naming: `release/v1.2.3`

## Workflow Steps

### Feature Development

```bash
# Start new feature
git checkout develop
git pull origin develop
git checkout -b feature/new-awesome-feature

# Work on feature
git add .
git commit -m "feat: add awesome feature"
git push origin feature/new-awesome-feature

# Create pull request to develop
# After review and CI passes, merge via GitHub
```

### Bug Fixes

```bash
# Start bug fix
git checkout develop
git pull origin develop
git checkout -b bugfix/fix-critical-issue

# Fix the bug
git add .
git commit -m "fix: resolve critical issue with validation"
git push origin bugfix/fix-critical-issue

# Create pull request to develop
```

### Hotfix Process

```bash
# Start hotfix from master
git checkout master
git pull origin master
git checkout -b hotfix/v1.2.1

# Apply critical fix
git add .
git commit -m "fix: critical security vulnerability"
git push origin hotfix/v1.2.1

# Create PR to master
# After merge, also merge to develop to sync changes
```

### Release Process

```bash
# Start release preparation
git checkout develop
git pull origin develop
git checkout -b release/v1.3.0

# Prepare release (version bumps, changelog, etc.)
git add .
git commit -m "chore: prepare release v1.3.0"
git push origin release/v1.3.0

# Create PR to master
# After merge, tag will be created automatically by release-please
```

## Automated Workflows

gem-ci includes automated workflows that integrate with this GitFlow:

### CI Triggers

- **Feature/Bugfix branches**: Run CI tests on push and PR
- **Develop branch**: Full CI suite including integration tests
- **Master branch**: Complete CI/CD including release preparation
- **Release branches**: Pre-release validation and artifact generation

### Branch Protection

Repository rulesets enforce the GitFlow model:

- **Master**: Requires PR reviews, status checks, signed commits
- **Develop**: Requires status checks for integration
- **Release branches**: Requires CI validation before merge

### Automated Release

- Release Please manages version bumps and changelog generation
- Tags and releases are created automatically on master merges
- RubyGems publishing happens automatically for tagged releases

## Commit Message Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `ci`: CI/CD changes
- `perf`: Performance improvements
- `build`: Build system changes

### Examples

```bash
git commit -m "feat: add support for custom linting rules"
git commit -m "fix: resolve memory leak in test runner"
git commit -m "docs: update installation guide with Ruby 3.3 requirements"
git commit -m "ci: optimize workflow to use only Ruby 3.3 for cost savings"
```

## Integration with gem-ci Workflows

### Status Checks

Each branch type triggers appropriate workflows:

```yaml
# .github/workflows/02-ci.yml runs on:
- feature/* branches (PR events)
- bugfix/* branches (PR events)  
- develop branch (push events)
- master branch (push events)
```

### Quality Gates

- **Code Quality**: RuboCop, custom linting
- **Security**: CodeQL analysis, vulnerability scanning
- **Testing**: RSpec test suite with coverage
- **Documentation**: Link validation, structure checks

### Release Automation

```yaml
# .github/workflows/06-release.yml handles:
- Version detection from conventional commits
- Changelog generation
- GitHub release creation
- RubyGems publication
- Slack notifications
```

## Best Practices

### Branch Naming

- Use descriptive names: `feature/add-parallel-testing`
- Include issue numbers: `bugfix/123-fix-memory-leak`
- Keep names short but clear
- Use kebab-case for consistency

### Pull Request Guidelines

- **Title**: Use conventional commit format
- **Description**: Explain what and why, not how
- **Reviewers**: Request appropriate team members
- **Labels**: Apply relevant labels automatically via labeler

### Merge Strategy

- **Squash and merge** for feature branches
- **Create merge commit** for release branches
- **Rebase and merge** for small fixes (optional)

## Troubleshooting

### Common Issues

**Branch protection conflicts:**
```bash
# If direct push is blocked
git checkout -b fix/update-readme
# Make changes, then PR instead of direct push
```

**Merge conflicts:**
```bash
# Update your branch with latest develop
git checkout feature/my-feature
git fetch origin
git rebase origin/develop
# Resolve conflicts, then continue
git rebase --continue
```

**Failed status checks:**
```bash
# Run tests locally first
bundle exec rspec
bundle exec rubocop
# Fix issues before pushing
```

## References

- [Git Flow Original](https://nvie.com/posts/a-successful-git-branching-model/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

This GitFlow model balances structure with simplicity, ensuring quality while maintaining development velocity.