require 'net/http'

module Hubspot
  class HttpResponse < Object
    attr_accessor :response

    def initialize(response)
      @response = response
    end

    def self.call(response)
      new(response).constructor
    end

    def constructor
      case response
        when Net::HTTPSuccess
          body = JSON.parse response.body if response.body && response.body.length >= 2
          { 'body': body, 'status': response.code }
        when Net::HTTPUnauthorized
          { 'error' => "#{response.message}: username and password set and correct?", 'status' => response.code }
        when Net::HTTPServerError
          { 'error' => "#{response.message}: try again later?", 'status' => response.code }
        else
          { 'error' => response.message, 'status' => response.code }
      end
    end
  end
end
