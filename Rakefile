require 'bundler/setup'

desc 'Runs all the specs'
task :spec do
  title 'Running Unit Tests'
  files = FileList['spec/**/*_spec.rb'].shuffle.join(' ')
  sh "bundle exec bacon #{files}"

  title 'Running RuboCop'
  Rake::Task['rubocop'].invoke
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = %w(lib spec Rakefile)
end

task default: :spec

#----

def title(title)
  puts "\033[0;36m#{title}\033[0m"
end