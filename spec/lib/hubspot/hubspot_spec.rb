require 'spec_helper'
require 'hubspot/hubspot'

describe Hubspot do
  let(:url) { 'foo/bar/path' }
  let(:options) { {'a': 'a', 'b': 'b', 'c': 'c'} }
  describe "self.get" do
    it { allow(described_class).to receive(:get).with(url, options) }
  end
  describe "self.post" do
    it { allow(described_class).to receive(:post).with(url, options) }
  end
  describe Hubspot::Base do
    subject { described_class.new }
    describe "#initialize"do
      it { expect( subject.respond_to?(:verb) ).to be_truthy }
      it { expect( subject.respond_to?(:url) ).to be_truthy }
      it { expect( subject.respond_to?(:options) ).to be_truthy }
    end
    describe "#send" do
      it { 
        stub_request(:post, "http://https//api.hubapi.com:80foo/bar/path").
          with(
            body: "a=a&b=b&c=c",
            headers: {
        	  'Accept'=>'*/*',
        	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        	  'Content-Type'=>'application/json',
        	  'User-Agent'=>'Ruby'
            }).
          to_return(status: 200, body: "", headers: {})

        response = subject.send(:post, url, options)
        expect(response[:status]).to eq "200"
      }
    end
  end
end
