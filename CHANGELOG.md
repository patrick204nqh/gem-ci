# Changelog

## [0.4.0](https://github.com/patrick204nqh/gem-ci/compare/gem-ci-v0.3.0...gem-ci/v0.4.0) (2025-07-27)


### 🚀 Features

* Add composite actions for performance monitoring, command retry, test execution, and environment setup ([a4ffac6](https://github.com/patrick204nqh/gem-ci/commit/a4ffac66b796e7a22ee857d20fc4aed6d4c6717a))
* Add Dependabot configuration for automated dependency updates ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Add GitFlow guide and workflow diagram for gem-ci projects ([bccdf0b](https://github.com/patrick204nqh/gem-ci/commit/bccdf0b056fe181ae0586f370a0a5da25dc65d77))
* Add GitHub App token generation for PR status updates ([3662c2e](https://github.com/patrick204nqh/gem-ci/commit/3662c2e1366142051eb40a96a61944a2cb1bc72a))
* Add local testing scripts for gem-ci workflows ([37ac022](https://github.com/patrick204nqh/gem-ci/commit/37ac0224a74d6410bc31f796333271a8330c6a47))
* Add markdownlint configuration with relaxed rules for better developer experience ([e8e905a](https://github.com/patrick204nqh/gem-ci/commit/e8e905a088200bb094630558ec02e5fc283b9620))
* Add release management configuration and update gem structure ([bd8ae0c](https://github.com/patrick204nqh/gem-ci/commit/bd8ae0c5774f7be38211b8aa14423d87ae72edbf))
* **ci:** Add PR status update action for CI, Security, and Quality workflows ([b9a42d9](https://github.com/patrick204nqh/gem-ci/commit/b9a42d97c4a8bd750bb87b29415929784e058261))
* Enhance PR status comment with structured table for workflow results ([3f3520d](https://github.com/patrick204nqh/gem-ci/commit/3f3520df4f1263059fe8ac76379e0bccee2a8326))
* Implement GitHub reaction actions for PRs, releases, and comments ([4fb4d24](https://github.com/patrick204nqh/gem-ci/commit/4fb4d24b4ca354128674f6b0ca3997cf977f0388))
* Refactor bot command workflow to enhance command handling and response structure ([5262bc3](https://github.com/patrick204nqh/gem-ci/commit/5262bc38441df89ad1f51fb99f95a337e7e20ec2))
* Update Ruby version in branch protection and push restrictions; add GitHub App token generation to ecosystem workflow ([611cd3e](https://github.com/patrick204nqh/gem-ci/commit/611cd3e37d64b5e290d73e9feebe28e306a4d6d6))


### 🐛 Bug Fixes

* Add missing checkout step in stale management job ([679a603](https://github.com/patrick204nqh/gem-ci/commit/679a60377930993c42745f6cc0c0b7f24781961c))
* Correct description formatting for sponsored label in labels.yml ([a013d1c](https://github.com/patrick204nqh/gem-ci/commit/a013d1c1a4a6462eb53b13bc783095858ac9ad6f))
* Improve command execution readability in CI jobs ([c54b578](https://github.com/patrick204nqh/gem-ci/commit/c54b578385c3eabe2c1ee54c9c4ad731daa4ff09))
* Improve description formatting in gemspec for better readability ([447313f](https://github.com/patrick204nqh/gem-ci/commit/447313f12a96970181f5472a2b575ff2a6349b81))
* Simplify command execution in CI jobs for better readability ([aa9a8d2](https://github.com/patrick204nqh/gem-ci/commit/aa9a8d2135852ff7639fa1cbc46667ea3d90949e))
* Update gemspec metadata to include homepage URI and correct documentation URI ([02dfb2b](https://github.com/patrick204nqh/gem-ci/commit/02dfb2ba4c5c60a56123a4e00bbd56beef5e1b1e))
* Update label configuration file paths in workflows ([94937a3](https://github.com/patrick204nqh/gem-ci/commit/94937a345cd3b779474fa59bc2571a3b9f83d751))
* Update sponsored label description and adjust workflow triggers for label synchronization ([533ef4a](https://github.com/patrick204nqh/gem-ci/commit/533ef4aba474b5262596e1c34ad57c200987f1bd))
* Update super-linter to version 6 and add filter to exclude coverage files ([229a28c](https://github.com/patrick204nqh/gem-ci/commit/229a28c46f20581c64253bd1bbd20dfd7e6a6dbd))


### 📚 Documentation

* Add README for validation workflows and their purposes ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Create GitHub App setup guide for branded automation ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Create repository secrets setup guide for automation workflows ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))
* Revise main README to enhance clarity and detail on automation features ([14e2b9b](https://github.com/patrick204nqh/gem-ci/commit/14e2b9b0b09bc4fc308ecb9eb594cdcc41650aaf))


### 🔧 Dependencies

* **deps:** Bump json from 2.13.0 to 2.13.1 ([ae45255](https://github.com/patrick204nqh/gem-ci/commit/ae4525555a35d1a017b532568fed312fdde1841f))
* **deps:** Bump rubocop from 1.78.0 to 1.79.0 in the development group ([01e4bc0](https://github.com/patrick204nqh/gem-ci/commit/01e4bc0da2e43ce48998756f1b18b743aa2d49cc))


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

* **deps:** Bump github/codeql-action from 2 to 3 in the security-actions group ([3a87434](https://github.com/patrick204nqh/gem-ci/commit/3a87434d016875f20d0d65342cad8c4261baa08a))
* **deps:** Bump github/codeql-action in the security-actions group ([2cecda3](https://github.com/patrick204nqh/gem-ci/commit/2cecda34c7afa72919ab1f337dc94287e6b492c7))
* **deps:** Bump github/super-linter from 4 to 7 in the quality-actions group ([394950e](https://github.com/patrick204nqh/gem-ci/commit/394950e4690a1e5b2560f8e24df3dc977ec55fec))
* **deps:** Bump github/super-linter in the quality-actions group ([48573f1](https://github.com/patrick204nqh/gem-ci/commit/48573f1a80df84e1222ce72e33d0527b61a3bb72))
* **deps:** Bump the github-actions group across 1 directory with 3 updates ([71f9254](https://github.com/patrick204nqh/gem-ci/commit/71f9254aa0670b7b0fa1f9fc5240bc7ecaff2cb1))
* **deps:** Bump the github-actions group across 1 directory with 3 updates ([0c55db5](https://github.com/patrick204nqh/gem-ci/commit/0c55db53910128174b982ac9e4f9663605be6cae))
* **saving-cost:** Add auto-labeling and repository labels configuration; update workflows for Slack notifications and command handling ([7cbd8de](https://github.com/patrick204nqh/gem-ci/commit/7cbd8de140a0182d06a095dbca009383587c8144))
* **workflows:** Refactor GitHub Actions and Documentation ([bf9bca1](https://github.com/patrick204nqh/gem-ci/commit/bf9bca1d0dfe6e3ac7c508231a0e8afea4a9d633))

## [0.3.0](https://github.com/patrick204nqh/gem-ci/compare/gem-ci/v0.2.1...gem-ci/v0.3.0) (2025-07-27)


### 🚀 Features

* Add GitFlow guide and workflow diagram for gem-ci projects ([bccdf0b](https://github.com/patrick204nqh/gem-ci/commit/bccdf0b056fe181ae0586f370a0a5da25dc65d77))
* Add GitHub App token generation for PR status updates ([3662c2e](https://github.com/patrick204nqh/gem-ci/commit/3662c2e1366142051eb40a96a61944a2cb1bc72a))
* Add local testing scripts for gem-ci workflows ([37ac022](https://github.com/patrick204nqh/gem-ci/commit/37ac0224a74d6410bc31f796333271a8330c6a47))
* **ci:** Add PR status update action for CI, Security, and Quality workflows ([b9a42d9](https://github.com/patrick204nqh/gem-ci/commit/b9a42d97c4a8bd750bb87b29415929784e058261))
* Enhance PR status comment with structured table for workflow results ([3f3520d](https://github.com/patrick204nqh/gem-ci/commit/3f3520df4f1263059fe8ac76379e0bccee2a8326))
* Implement GitHub reaction actions for PRs, releases, and comments ([4fb4d24](https://github.com/patrick204nqh/gem-ci/commit/4fb4d24b4ca354128674f6b0ca3997cf977f0388))
* Refactor bot command workflow to enhance command handling and response structure ([5262bc3](https://github.com/patrick204nqh/gem-ci/commit/5262bc38441df89ad1f51fb99f95a337e7e20ec2))
* Update Ruby version in branch protection and push restrictions; add GitHub App token generation to ecosystem workflow ([611cd3e](https://github.com/patrick204nqh/gem-ci/commit/611cd3e37d64b5e290d73e9feebe28e306a4d6d6))


### 🐛 Bug Fixes

* Update label configuration file paths in workflows ([94937a3](https://github.com/patrick204nqh/gem-ci/commit/94937a345cd3b779474fa59bc2571a3b9f83d751))


### 🔧 Dependencies

* **deps:** Bump json from 2.13.0 to 2.13.1 ([ae45255](https://github.com/patrick204nqh/gem-ci/commit/ae4525555a35d1a017b532568fed312fdde1841f))
* **deps:** Bump rubocop from 1.78.0 to 1.79.0 in the development group ([01e4bc0](https://github.com/patrick204nqh/gem-ci/commit/01e4bc0da2e43ce48998756f1b18b743aa2d49cc))


### 🤖 CI/CD

* **deps:** Bump github/codeql-action from 2 to 3 in the security-actions group ([3a87434](https://github.com/patrick204nqh/gem-ci/commit/3a87434d016875f20d0d65342cad8c4261baa08a))
* **deps:** Bump github/codeql-action in the security-actions group ([2cecda3](https://github.com/patrick204nqh/gem-ci/commit/2cecda34c7afa72919ab1f337dc94287e6b492c7))
* **deps:** Bump github/super-linter from 4 to 7 in the quality-actions group ([394950e](https://github.com/patrick204nqh/gem-ci/commit/394950e4690a1e5b2560f8e24df3dc977ec55fec))
* **deps:** Bump github/super-linter in the quality-actions group ([48573f1](https://github.com/patrick204nqh/gem-ci/commit/48573f1a80df84e1222ce72e33d0527b61a3bb72))
* **deps:** Bump the github-actions group across 1 directory with 3 updates ([71f9254](https://github.com/patrick204nqh/gem-ci/commit/71f9254aa0670b7b0fa1f9fc5240bc7ecaff2cb1))
* **deps:** Bump the github-actions group across 1 directory with 3 updates ([0c55db5](https://github.com/patrick204nqh/gem-ci/commit/0c55db53910128174b982ac9e4f9663605be6cae))
* **saving-cost:** Add auto-labeling and repository labels configuration; update workflows for Slack notifications and command handling ([7cbd8de](https://github.com/patrick204nqh/gem-ci/commit/7cbd8de140a0182d06a095dbca009383587c8144))

## [0.2.1](https://github.com/patrick204nqh/gem-ci/compare/gem-ci/v0.2.0...gem-ci/v0.2.1) (2025-07-26)


### 🐛 Bug Fixes

* Add missing checkout step in stale management job ([679a603](https://github.com/patrick204nqh/gem-ci/commit/679a60377930993c42745f6cc0c0b7f24781961c))
* Update gemspec metadata to include homepage URI and correct documentation URI ([02dfb2b](https://github.com/patrick204nqh/gem-ci/commit/02dfb2ba4c5c60a56123a4e00bbd56beef5e1b1e))

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
