require 'spec_helper'
require 'hubspot/http_request'

describe Hubspot::HttpRequest do
  let(:url) { 'foo/bar' }
  let(:options) { { 'a': 'a', 'b': 'b', 'c': 'c' } }
  
  let(:hapikey) { '4d2b1502-c296-4227-900f-47bffb283434' }
  let(:user_id) { '5432373' }

  # it { expect( subject.respond_to?(:http) ).to be_truthy }

  describe "with valid params" do
    describe "#get" do
      # context "invalid api" do
      #   let(:response) { subject.get('foo/bar', {}) }
      #   it { expect(response['error']).to eq("Bad Request") }
      #   it { expect(response['status']).to eq("400") }
      # end
    end
    describe "#post" do
      # context "invalid api" do
      #   let(:response) { subject.post('foo/bar', '{}') }
      #   it { expect(response['error']).to eq("Bad Request") }
      #   it { expect(response['status']).to eq("400") }
      # end
      context "valid api" do
        let(:created_by) { 'dustin@smalhaus.com' }
        let(:campaign_name) { 'nwb-development-test' }
        let(:options2) { "{'createdBy': #{created_by}, 'campaignName': #{campaign_name}}" }
        let(:body) { '{ "userName": "hrfdvt58el@62515.smtp.hubspot.net", "password": "3432fff8eljl1249fjjasdfnv3", "portalId": 62515, "emailCampaignId": 14862038, "createdAt": 1415660606232, "deleted": false, "createdBy": "maxiak@hubspot.com", "appId": 22709, "campaignName": "campaign name test" }' }

        let(:response) { subject.post("/email/public/v1/smtpapi/tokens?hapikey=#{hapikey}&userId=#{user_id}", options)}
        
        it {
          stub_request(:post, "http://https//api.hubapi.com:80/email/public/v1/smtpapi/tokens?hapikey=4d2b1502-c296-4227-900f-47bffb283434&userId=5432373").with(body: "a=a&b=b&c=c", headers: { 'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby' }).to_return(status: 200, body: body, headers: {})

          expect(response[:status]).to eq "200"
          expect(response).to match_response_schema("smptpapi/tokens")
        }
        # it { expect(response['status']).to eq("400") }
      end
    end
  end
end