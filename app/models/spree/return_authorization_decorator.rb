module Spree
  module ReturnAuthorizationDecorator
    def self.prepended(base)
      base.after_create :send_return_authorization_mailer
    end

    def send_return_authorization_mailer
      user  = order.try(:user)
      email = user.try(:email) || order.email

      Spree::ReturnAuthorizationMailer.email(email, self).deliver_now if email
    end
  end
end

Spree::ReturnAuthorization.prepend Spree::ReturnAuthorizationDecorator