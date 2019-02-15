require 'hubspot/mailer'

module Spree
  class UserMailer < Hubspot::Mailer
    def reset_password_instructions(user, token, *_args)
      @edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)

      mail(to: user.email, from: from_address, subject: "Hubspot - TODO UPDATE ME")
    end

    private

    def from_address
      "no-reply@example.com"
    end
  end
end

