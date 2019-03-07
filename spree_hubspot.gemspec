# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_hubspot'
  s.version     = '3.0.0'
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
  s.required_ruby_version = '>= 2.3.0'

  s.add_dependency 'spree_core', '~> 3.4.0'
  s.add_dependency 'hubspot', '~> 1.0', '>= 1.0.2'

  s.add_development_dependency 'spree_auth_devise', '~> 3.3'
  s.add_development_dependency 'spree_gateway', '~> 3.3'

  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3', '~> 1.3.9'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'json-schema'
end
