require 'hubspot/transaction_email/mailer'

module Spree
  class UserMailer < Hubspot::TransactionEmail::Mailer
    def reset_password_instructions(user, token, *_args)
      @edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)

      email_id = if from_store.url.include? ".uk"
          SpreeHubspot::Config.uk_password_reset_email_id
        elsif from_store.url.include? ".au"
          SpreeHubspot::Config.aus_password_reset_email_id
        elsif from_store.url.include? ".eu"
          SpreeHubspot::Config.eu_password_reset_email_id
        end
      end

      mail(email_id: email_id, message: { to: user.email }) if email_id
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

