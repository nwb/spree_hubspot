module Spree
  module ReturnAuthorizationDecorator
    def self.prepended(base)

    end

    def send_return_authorization_mailer
      user  = order.try(:user)
      email = user.try(:email) || order.email

      Spree::ReturnAuthorizationMailer.email(email, self).deliver_now if email
    end
  end
end

Spree::ReturnAuthorization.prepend Spree::ReturnAuthorizationDecorator