require 'hubspot/hubspot'

module Spree
  module ReturnItemDecorator
    def self.prepended(base)
      base.after_create :sync_return_item_with_hubspot_deals_api
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
  end
end

Spree::ReturnItem.prepend Spree::ReturnItemDecorator