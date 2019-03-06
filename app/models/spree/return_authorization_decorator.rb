module Spree
  module ReturnAuthorizationDecorator
    def self.prepended(base)
      base.after_create :send_return_authorization_mailer
    end

    def send_return_authorization_mailer
      user = order.try(:user)
      Spree::ReturnAuthorizationMailer.email(user, self).deliver_now if user
    end
  end
end

Spree::ReturnAuthorization.prepend Spree::ReturnAuthorizationDecorator