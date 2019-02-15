require 'spec_helper'

RSpec.describe Spree::UserMailer, type: :mailer do
  it { expect(described_class.superclass).to eq(Hubspot::Mailer) }
end