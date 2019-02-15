require 'spec_helper'
require 'hubspot/object'
require 'hubspot/errors'

describe Hubspot::Object do
  describe "self.call" do
    it { allow(described_class).to receive(:call).with([:a, :b, :c]).and_raise(NotImplementedError) }
  end
  describe "#constructor" do
    it { allow(subject).to receive(:constructor).and_raise(NotImplementedError) }
  end
  describe "#success?" do
    it { expect(subject.success?).to be_truthy }
  end
  describe "#failure?" do
    it { expect(subject.failure?).to be_falsey }
  end
  describe "#errors" do
    it { expect(subject.errors).to be_kind_of(Hubspot::Errors) }
  end
  describe "#call" do
    it { allow(subject).to receive(:call).and_raise(NotImplementedError) }
  end
end