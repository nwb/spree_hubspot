module Hubspot
  class Mailer < ActionMailer::Base
    def mail(headers = {}, &block)
      smtp_user = SpreeHubspot::Config.user_name
      smtp_password = SpreeHubspot::Config.password
      smtp_host = SpreeHubspot::Config.address
      smtp_port = SpreeHubspot::Config.port

      delivery_method_options = { user_name: smtp_user, password: smtp_password, address: smtp_host, port: smtp_port, authentication: :plain, enable_starttls_auto: true }

      headers = headers.merge!(delivery_method_options: delivery_method_options)

      super
    end
  end
end
