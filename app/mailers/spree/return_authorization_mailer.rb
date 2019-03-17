require 'hubspot/transaction_email/mailer'

module Spree
  class ReturnAuthorizationMailer < Hubspot::TransactionEmail::Mailer
    def email(to_email, return_authorization, *_args)

      email_id = case return_authorization.order.store.code
        when "nwb", "pwb", "he"
          SpreeHubspot::Config.com_rma_email_id
        when "pwbca"
          SpreeHubspot::Config.ca_rma_email_id
        when "pwbuk"
          SpreeHubspot::Config.uk_rma_email_id
        when "pwbau"
          SpreeHubspot::Config.aus_rma_email_id
        when "pwbeu"
          SpreeHubspot::Config.eu_rma_email_id
        end

      if return_authorization.return_authorization_reason_id.nil?
        return_reason = return_authorization.memo
      else
        return_reason =Spree::ReturnAuthorizationReason.find(return_authorization.return_authorization_reason_id).name
      end

      returnunits=[]
      return_authorization.return_items.each do |return_item|
          returnunits << {:sku => return_item.inventory_unit.variant.sku, :return_quantity => return_item.inventory_unit.quantity, :return_state => return_item.return_state }
      end

      contact_properties = []

      custom_properties = [
        { name: "id", value: return_authorization.id },
        { name: "number", value: return_authorization.number },
        { name: "state", value: return_authorization.state },
        { name: "order_id", value: return_authorization.order_id },
        { name: "memo", value: return_authorization.memo },
        { name: "created_at", value: return_authorization.created_at },
        { name: "updated_at", value: return_authorization.updated_at },
        { name: "stock_location_id", value: return_authorization.stock_location_id },
        { name: "return_authorization_reason_id", value: return_authorization.return_authorization_reason_id },
        { name: "return_reason", value: return_reason},
        { name: "return_items", value: returnunits}
      ]

      mail(email_id: email_id, message: { to: to_email }, contact_properties: contact_properties, custom_properties: custom_properties) if email_id
    end

    private

    def from_address
      "no-reply@example.com"
    end

    def from_store
      @store ||= Spree::Store.current
    end
  end
end
