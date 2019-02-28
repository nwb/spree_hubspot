module SpreeHubspot
  class Engine < Rails::Engine
    require 'spree/core'
    require 'hubspot'

    isolate_namespace Spree
    engine_name 'spree_hubspot'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree_hubspot.environment", before: :load_config_initializers do |app|
      SpreeHubspot::Config = SpreeHubspot::Configuration.new

      Hubspot.configure do |config|
        config.hapikey = SpreeHubspot::Config.hapikey
        config.user_name = SpreeHubspot::Config.user_name
        config.password = SpreeHubspot::Config.password
        config.address = SpreeHubspot::Config.address
        config.port = SpreeHubspot::Config.port
      end
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
