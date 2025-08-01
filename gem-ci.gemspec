# frozen_string_literal: true

require_relative "lib/gem_ci/version"

Gem::Specification.new do |spec|
  spec.name = "gem-ci"
  spec.version = GemCi::VERSION
  spec.authors = ["Huy Nguyen"]
  spec.email = ["patrick204nqh@gmail.com"]

  spec.summary = "Comprehensive OSS automation showcase with battle-tested GitHub Actions"
  spec.description = "A showcase repository demonstrating advanced CI/CD workflows, automated testing, " \
                     "security scanning, community management, and comprehensive automation for Ruby gems."
  spec.homepage = "https://github.com/patrick204nqh/gem-ci"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["source_code_uri"] = "https://github.com/patrick204nqh/gem-ci"
  spec.metadata["changelog_uri"] = "https://github.com/patrick204nqh/gem-ci/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://github.com/patrick204nqh/gem-ci/blob/main/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
