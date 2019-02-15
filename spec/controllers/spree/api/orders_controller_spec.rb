require 'spec_helper'


describe Spree::Api::OrdersController, :type => :controller do
  routes { Spree::Core::Engine.routes }
  render_views

  let(:current_api_user) do
    user = Spree.user_class.new(email: "spree@example.com", password: "password")
    user.generate_spree_api_key!
    user
  end

  describe 'GET #show' do
    let(:order) { create :order_with_line_items }
    subject { get :show, id: order.to_param, token: current_api_user.spree_api_key, format: :json }

    before do
      allow_any_instance_of(Order).to receive_messages :user => current_api_user
    end

    it { expect(json_response["store_id"]).to eq(1) }
  end
end