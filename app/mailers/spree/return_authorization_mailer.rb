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

      mail(email_id: email_id, message: { to: user.email }) if email_id
    end

    private

    def from_address
      "no-reply@example.com"
    end
  end
end
