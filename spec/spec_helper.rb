# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'simplecov'
SimpleCov.start

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'settingslogic'
require 'active_support/all'
require 'zonebie'
require 'baw-audio-tools'
require File.dirname(__FILE__) + '/baw-audio-tools/shared_spec_helper'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.profile_examples = 20

  # redirect puts into a text file
  original_stderr = $stderr
  original_stdout = $stdout

  config.before(:suite) do
    # Redirect stderr and stdout
    $stderr = File.new(File.join(File.dirname(__FILE__), '..', 'tmp', 'rspec_stderr.txt'), 'w')
    $stdout = File.new(File.join(File.dirname(__FILE__), '..', 'tmp', 'rspec_stdout.txt'), 'w')
  end

  config.after(:suite) do
    $stderr = original_stderr
    $stdout = original_stdout
  end

# for settings when running tests. In normal use, Settings are used from the parent ruby project.
  class Settings < Settingslogic
    source File.dirname(__FILE__) + '/baw-audio-tools/test-settings.yml'
    namespace 'test'
  end

  # so Time.zone.parse can be used
  #Time.zone = 'UTC'
  Zonebie.set_random_timezone
end
