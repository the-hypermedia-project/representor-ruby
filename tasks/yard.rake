require 'rake'
require 'rake/clean'

CLOBBER.include('.yardoc', 'yardoc')
CLOBBER.uniq!

begin
  require 'yard'
  require 'yard/rake/yardoc_task'

  namespace :doc do
    desc 'Generate Yardoc documentation'
    YARD::Rake::YardocTask.new
  end

  task doc: 'doc:yard'
rescue LoadError
  # no yard
  task doc: 'doc:rdoc'
end
