require 'spec_helper'
require 'hubspot/errors'

describe Hubspot::Errors do
  before { subject.add(:validation, "Example description error 1.") }

  describe "#add" do
    it { expect(subject).to have_key(:validation) }
    it { expect(subject[:validation]).to include("Example description error 1.") }
  end
  describe "#add_multiple_errors" do
    it {
      expect{ 
        subject.add(:validation, "Example description error 2.")
        subject.add(:validation, "Example description error 3.")
      }.to change{ subject.count }.from(1).to(3)
    }
  end
end