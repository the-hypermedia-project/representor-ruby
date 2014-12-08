desc 'Runs all the specs'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.patterns = %w(lib spec tasks Rakefile)
  end
rescue LoadError
  # no rspec available
  # no rubycop available
  true # make rubocop happy
end

desc 'Runs all the tests and checks style'
task :tests do
  Rake::Task['spec'].invoke
  Rake::Task['rubocop'].invoke
end

task default: :tests
