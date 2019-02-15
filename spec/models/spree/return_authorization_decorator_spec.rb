require 'spec_helper'

describe Spree::ReturnAuthorization, type: :model do
  let(:order) { create(:shipped_order) }
  let(:stock_location) { create(:stock_location) }
  let(:rma_reason) { create(:return_authorization_reason) }
  let(:inventory_unit_1) { order.inventory_units.first }

  let(:variant) { order.variants.first }
  let(:return_authorization) { Spree::ReturnAuthorization.new(order: order, stock_location_id: stock_location.id, return_authorization_reason_id: rma_reason.id) }
end