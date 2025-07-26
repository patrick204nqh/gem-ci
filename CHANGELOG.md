# Changelog

## [0.2.0](https://github.com/patrick204nqh/gem-ci/compare/gem-ci-v0.1.1...gem-ci/v0.2.0) (2025-07-26)


### 🚀 Features

* Add composite actions for performance monitoring, command retry, test execution, and environment setup ([a4ffac6](https://github.com/patrick204nqh/gem-ci/commit/a4ffac66b796e7a22ee857d20fc4aed6d4c6717a))
* Add Dependabot configuration for automated dependency updates ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Add release management configuration and update gem structure ([bd8ae0c](https://github.com/patrick204nqh/gem-ci/commit/bd8ae0c5774f7be38211b8aa14423d87ae72edbf))


### 🐛 Bug Fixes

* Correct description formatting for sponsored label in labels.yml ([a013d1c](https://github.com/patrick204nqh/gem-ci/commit/a013d1c1a4a6462eb53b13bc783095858ac9ad6f))
* Improve command execution readability in CI jobs ([c54b578](https://github.com/patrick204nqh/gem-ci/commit/c54b578385c3eabe2c1ee54c9c4ad731daa4ff09))
* Improve description formatting in gemspec for better readability ([447313f](https://github.com/patrick204nqh/gem-ci/commit/447313f12a96970181f5472a2b575ff2a6349b81))
* Simplify command execution in CI jobs for better readability ([aa9a8d2](https://github.com/patrick204nqh/gem-ci/commit/aa9a8d2135852ff7639fa1cbc46667ea3d90949e))
* Update sponsored label description and adjust workflow triggers for label synchronization ([533ef4a](https://github.com/patrick204nqh/gem-ci/commit/533ef4aba474b5262596e1c34ad57c200987f1bd))


### 📚 Documentation

* Add README for validation workflows and their purposes ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Create GitHub App setup guide for branded automation ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Create repository secrets setup guide for automation workflows ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Revise main README to enhance clarity and detail on automation features ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))


### ♻️ Refactoring

* **ci-cd:** Remove legacy Ruby workflow and add validation workflows for GitHub App, labels synchronization, repository rulesets, and Slack integration. Update Gemfile with new dependencies for testing and coverage reporting. Enhance spec helper for coverage metrics and clean up existing tests. ([6365ae2](https://github.com/patrick204nqh/gem-ci/commit/6365ae2ef85b92673bd75399ac2adf0d65e82aff))
* Rename community management workflow for clarity ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Rename ecosystem integration workflow for clarity ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Rename monitoring workflow for clarity ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Rename quality workflow for clarity ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Rename release management workflow for clarity ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Rename security workflow for clarity ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Replace GitHub App token action with local implementation for consistency across workflows ([715ba16](https://github.com/patrick204nqh/gem-ci/commit/715ba1642dece92a85534b671c85bba362976766))
* Replace performance-monitor action with inline command execution in CI jobs ([d8d9ff6](https://github.com/patrick204nqh/gem-ci/commit/d8d9ff6d8b609eb99d57e4a5cf337a08612382f3))
* Simplify CI workflows and enhance monitoring with basic health checks and summaries ([ad0c84a](https://github.com/patrick204nqh/gem-ci/commit/ad0c84ae798c8474b53b2be13d476fc90f3fbb7c))
* Standardize labeler.yml structure for file change types ([b34df93](https://github.com/patrick204nqh/gem-ci/commit/b34df9383345ac7c76ff4c3586fc5bec83933956))
* Standardize workflow names and update branch references to main and master ([017b4cf](https://github.com/patrick204nqh/gem-ci/commit/017b4cf1b284d62bdb676728df0cc97912dd9a43))
* Update CI/CD workflows to use default branch variable and adjust README for Ruby versions ([c0abddc](https://github.com/patrick204nqh/gem-ci/commit/c0abddcb159ef12a7c2e401864e46a3cb828771f))
* Update GitHub Actions workflows for improved error handling and metrics output ([0d07488](https://github.com/patrick204nqh/gem-ci/commit/0d07488e7f1d14f4fcc6b944e0abc18205fb2ea9))
* Update labeler configuration and enhance CI workflows with repository checkout steps ([d13d065](https://github.com/patrick204nqh/gem-ci/commit/d13d065eb48d106e0791811421966a9c07cabae5))
* Update security and ecosystem workflows for improved pull request handling and reduce matrix size ([caacb33](https://github.com/patrick204nqh/gem-ci/commit/caacb3354718edd7a76b0b247b265beea06e7eaa))
* Update workflow names and improve branch protection rules; enhance label configurations ([79c58d2](https://github.com/patrick204nqh/gem-ci/commit/79c58d258fc83aa690843c166a68fac1e0a97e5c))


### 🤖 CI/CD

* **workflows:** Refactor GitHub Actions and Documentation ([bf9bca1](https://github.com/patrick204nqh/gem-ci/commit/bf9bca1d0dfe6e3ac7c508231a0e8afea4a9d633))
