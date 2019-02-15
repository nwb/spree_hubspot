require 'spec_helper'

describe Spree::ReturnAuthorizationMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:order) { create(:shipped_order) }
  let(:stock_location) { create(:stock_location) }
  let(:rma_reason) { create(:return_authorization_reason) }

  let(:return_authorization) { Spree::ReturnAuthorization.new(order: order, stock_location_id: stock_location.id, return_authorization_reason_id: rma_reason.id) }

  it { expect { described_class.email(user, return_authorization).deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(2) }
end