require_relative 'http_request'

module Hubspot
  class << self
    def get(url, options)
      Base.new.send(:get, url, options)
    end

    def post(url, options)
      Base.new.send(:post, url, options)
    end
  end

  class Base < HttpRequest
    def send(verb = :get, url, options)
      self.method(verb).call(url, options)
    end
  end
end

