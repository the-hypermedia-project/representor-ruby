# Report test coverage in travis-ci
if ENV['REPORT_CODE_CLIMATE'] == 'true'
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

SPEC_DIR = File.expand_path('..', __FILE__)
lib_dir = File.expand_path('../lib', SPEC_DIR)

$LOAD_PATH.unshift(lib_dir)
$LOAD_PATH.uniq!

require 'rspec'

require 'bundler'
require 'simplecov'

if RUBY_VERSION.split('.').join < '200'
  require 'debugger'
  Debugger.start
else
  require 'byebug'
end

Bundler.setup

require 'representor'

Dir["#{SPEC_DIR}/support/*.rb"].each { |f| require f }

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random' unless ENV['RANDOMIZE'] == 'false'

  config.include Support::Helpers
end
