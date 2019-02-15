require_relative 'errors'

module Hubspot
  class Object
    class << self
      def call(*arg)
        Object.new(*arg).constructor
      end
    end

    attr_reader :result
    def constructor
      @result = call
      self
    end

    def success?
      !failure?
    end

    def failure?
      errors.any?
    end

    def errors
      @errors ||= Errors.new
    end

    def call
      raise NotImplementedError unless defined?(super)
    end
  end
end