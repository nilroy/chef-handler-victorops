$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'chef/handler/victorops/version'

GEM_NAME = 'chef-handler-victorops'
GEM_VERSION = VictoropsHandler::VERSION

desc "Build #{GEM_NAME} gem"
task :build do
  system "gem build #{GEM_NAME}.gemspec"
  system 'mkdir -p /tmp/chef-handler-mail-build'
  system "cp #{GEM_NAME}-#{GEM_VERSION}.gem /tmp/chef-handler-victorops-build/#{GEM_NAME}.gem"
end

desc "Push #{GEM_NAME} to rubygems.org"
task push: :build do
  system "gem push #{GEM_NAME}-#{GEM_VERSION}.gem"
end

desc 'Clean up build gems'
task :clean do
  system "rm -f #{GEM_NAME}-#{GEM_VERSION}.gem"
  system "rm -f test/build/#{GEM_NAME}.gem"
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
