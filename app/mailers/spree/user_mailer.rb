require 'hubspot/transaction_email/mailer'

module Spree
  class UserMailer < Hubspot::TransactionEmail::Mailer
    def reset_password_instructions(user, token, *_args)
      edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)

      email_id = if from_store.url.include? ".com"
          SpreeHubspot::Config.com_password_reset_email_id
        elsif from_store.url.include? ".ca"
          SpreeHubspot::Config.ca_password_reset_email_id
        elsif from_store.url.include? ".uk"
          SpreeHubspot::Config.uk_password_reset_email_id
        elsif from_store.url.include? ".au"
          SpreeHubspot::Config.aus_password_reset_email_id
        elsif from_store.url.include? ".eu"
          SpreeHubspot::Config.eu_password_reset_email_id
        end

      contact_properties = []

      custom_properties = [
        { name: "id", value: user.id },
        { name: "email", value: user.email },
        { name: "last_request_at", value: user.last_request_at },
        { name: "ship_address_id", value: user.ship_address_id },
        { name: "bill_address_id", value: user.bill_address_id },
        { name: "created_at", value: user.created_at },
        { name: "updated_at", value: user.updated_at },
        { name: "spree_api_key", value: user.spree_api_key },
        { name: "deleted_at", value: user.deleted_at },
        { name: "edit_password_reset_url", value: edit_password_reset_url }
      ]

      mail(email_id: email_id, message: { to: user.email }, contact_properties: contact_properties, custom_properties: custom_properties) if email_id
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
