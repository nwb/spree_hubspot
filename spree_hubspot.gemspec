# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_hubspot'
  s.version     = '3-4-stable'
  s.summary     = 'Hubspot Spree Extension'
  s.description = 'Hubspot Summary'
  s.required_ruby_version = '>= 2.2.0'

  s.author    = 'Dev User'
  s.email     = 'dev_user@example.com'
  s.homepage  = 'http://www.example.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'hubspot', '~> 1.0', '>= 1.0.2'


end
