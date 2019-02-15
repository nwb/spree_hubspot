require 'spec_helper'

describe Spree::UserMailer, type: :mailer do
  it { expect(described_class.superclass).to eq(Hubspot::Mailer) }
end