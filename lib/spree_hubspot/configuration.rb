module SpreeHubspot
  class Configuration < Spree::Preferences::Configuration
    preference :user_name, :string, default: "Hubspot SMTP Username"
    preference :password, :string, default: "Hubspot SMTP Password"
    preference :address, :string, default: "Hubspot SMTP Hostname"
    preference :port, :integer, default: "Hubspot SMTP Port"
    preference :hapikey, :string, default: "Hubspot API Key"

    preference :uk_rma_email_id, :string, default: "Hubspot Email Id"
    preference :uk_password_reset_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_recieved_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_reactivated_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_order_reminder_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_out_of_stock_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_generic_issue_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_credit_card_expired_email_id, :string, default: "Hubspot Email Id"
    preference :uk_subscription_canceled_email_id, :string, default: "Hubspot Email Id"

    preference :aus_rma_email_id, :string, default: "Hubspot Email Id"
    preference :aus_password_reset_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_recieved_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_reactivated_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_order_reminder_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_out_of_stock_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_generic_issue_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_credit_card_expired_email_id, :string, default: "Hubspot Email Id"
    preference :aus_subscription_canceled_email_id, :string, default: "Hubspot Email Id"
    
    preference :eu_rma_email_id, :string, default: "Hubspot Email Id"
    preference :eu_password_reset_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_recieved_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_reactivated_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_order_reminder_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_out_of_stock_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_generic_issue_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_credit_card_expired_email_id, :string, default: "Hubspot Email Id"
    preference :eu_subscription_canceled_email_id, :string, default: "Hubspot Email Id"
  end
end