# frozen_string_literal: true

# Enable coverage reporting in CI
if ENV["CI"] || ENV["COVERAGE"]
  require "simplecov"
  require "simplecov-cobertura"

  SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter.new([
                                                         SimpleCov::Formatter::HTMLFormatter,
                                                         SimpleCov::Formatter::CoberturaFormatter
                                                       ])

    add_filter "/spec/"
    add_filter "/vendor/"

    minimum_coverage 90
    refuse_coverage_drop
  end
end

require "gem_ci"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
