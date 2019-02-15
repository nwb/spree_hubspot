require 'hubspot/mailer'

module Spree
  class ReturnAuthorizationMailer < Hubspot::Mailer
    def email(user, return_authorization, *_args)
      mail(to: user.email, from: from_address, subject: "Hubspot Return Authorization - UPDATE ME")
    end

    private

    def from_address
      "no-reply@example.com"
    end
  end
end
