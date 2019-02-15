require 'spec_helper'

RSpec.describe Hubspot::Mailer, type: :mailer do
  it { expect(described_class.superclass).to eq(ActionMailer::Base) }

  let(:smtp_settings) { ActionMailer::Base.smtp_settings }

  it { expect(smtp_settings[:address]).to eq("smtp.hubapi.com") }
end