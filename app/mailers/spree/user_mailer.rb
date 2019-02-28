require 'hubspot/transaction_email/mailer'

module Spree
  class UserMailer < Hubspot::TransactionEmail::Mailer
    def reset_password_instructions(user, token, *_args)
      @edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)

      current_store = Spree::Store.current

      if current_store.url.include? ".uk"
        email_id = SpreeHubspot::Config.uk_password_reset_email_id
      elsif current_store.url.include? ".au"
        email_id = SpreeHubspot::Config.aus_password_reset_email_id
      elsif current_store.url.include? ".eu"
        email_id = SpreeHubspot::Config.eu_password_reset_email_id
      end

      mail(email_id: email_id, message: { to: user.email }) if email_id
    end

    private

    def from_address
      "no-reply@example.com"
    end
  end
end

