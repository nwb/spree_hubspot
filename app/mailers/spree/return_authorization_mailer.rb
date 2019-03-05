require 'hubspot/transaction_email/mailer'

module Spree
  class ReturnAuthorizationMailer < Hubspot::TransactionEmail::Mailer
    def email(user, return_authorization, *_args)
      current_store = Spree::Store.current

      if current_store.url.include? ".uk"
        email_id = SpreeHubspot::Config.uk_rma_email_id
      elsif current_store.url.include? ".au"
        email_id = SpreeHubspot::Config.aus_rma_email_id
      elsif current_store.url.include? ".eu"
        email_id = SpreeHubspot::Config.eu_rma_email_id
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
        { name: "return_authorization_reason_id", value: return_authorization.return_authorization_reason_id }
      ]

      mail(email_id: email_id, message: { to: user.email }, contact_properties: contact_properties, custom_properties: custom_properties) if email_id
    end

    private

    def from_address
      "no-reply@example.com"
    end
  end
end
