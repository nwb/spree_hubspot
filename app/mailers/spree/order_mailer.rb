require 'hubspot/transaction_email/mailer'

  class Spree::OrderMailer < Hubspot::TransactionEmail::Mailer

    def notify_customer(message_name, store_code, email, contact_properties, custom_properties)
      #byebug
      begin
        email_id = SpreeHubspot::Config.send(store_code + '_' + message_name)
        mail(email_id: email_id, message: { to: email }, contact_properties: contact_properties, custom_properties: custom_properties) if email_id
      rescue Exception=> e
      end
    end

  end
