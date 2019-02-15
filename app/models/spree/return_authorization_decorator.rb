require 'hubspot/hubspot'

module Spree
  module ReturnAuthorizationDecorator
    def self.prepended(base)
      base.after_create :sync_return_item_with_hubspot_deals_api
      base.after_initialize :send_return_authorization_mailer
    end
    
    def sync_return_item_with_hubspot_deals_api
      params = {
        "properties": [
          {
            "value": "Spree RMA",
            "name": "dealname"
          }
        ]
      }
      hapikey = SpreeHubspot::Config.hapikey
      Hubspot.post("/deals/v1/deal?hapikey=#{hapikey}", params)
    end

    def send_return_authorization_mailer
      user = order.try(:user)
      Spree::ReturnAuthorizationMailer.email(user, self).deliver_now if user
    end
  end
end

Spree::ReturnAuthorization.prepend Spree::ReturnAuthorizationDecorator