lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'chef/handler/victorops/version'

Gem::Specification.new do |s|
  s.name = 'chef-handler-victorops'
  s.version = VictoropsHandler::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = 'Chef report handler that uses victorops REST integration to raise an alert'
  s.description = s.summary
  s.author = 'Nilanjan Roy'
  s.email = 'nilanjan1.roy@gmail.com'
  s.homepage = 'https://github.com/nilroy/chef-handler-victorops'
  s.require_path = 'lib'
  s.files = %w[LICENSE README.md] + Dir.glob('lib/**/*')
  s.add_runtime_dependency 'victor_ops-client', '~> 0.3.0'
end
