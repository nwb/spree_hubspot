require 'net/http'
require_relative 'http_response'

module Hubspot
  class HttpRequest < Object
    BASE_URL = "https://api.hubapi.com"

    attr_accessor :http, :uri

    def initialize(debug = false)
      @uri = URI(BASE_URL)
      @http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == "https"
        @http.use_ssl = true
        @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end

      @http.set_debug_output($stdout) if debug
    end

    def get(path, options = {})
      errors.add(:validation, "Missing url") if url.blank?

      body = JSON.dump(options)
      request = Net::HTTP::Get.new(path, body)
      response = http.request(request)

      HttpResponse.call(response)
    end

    def post(path, options = {})
      errors.add(:validation, "Missing url") if url.blank?

      body = JSON.dump(options)
      request = Net::HTTP::Post.new(path) # uri.path or just uri
      request.add_field("Content-Type", "application/json")
      request.body = body
      response = http.request(request)

      HttpResponse.call(response)
    end
  end
end
