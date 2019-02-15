module SpreeHubspot
  class Configuration < Spree::Preferences::Configuration
    preference :user_name, :string, default: "Hubspot SMTP Username"
    preference :password, :string, default: "Hubspot SMTP Password"
    preference :address, :string, default: "Hubspot SMTP Hostname"
    preference :port, :integer, default: "Hubspot SMTP Port"
    preference :hapikey, :integer, default: "Hubspot API Key"
  end
end