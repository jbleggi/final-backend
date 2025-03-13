require 'rails_helper'

RSpec.describe CustomerSerializer, type: :serializer do
  let(:customer) { create(:customer, first_name: "John", last_name: "Doe", email: "john.doe@example.com", address_city: "New York", address_state: "NY", address_zip: "10001") }
  let(:serialized_customer) { CustomerSerializer.new(customer).serializable_hash }
  let(:result) {serialized_customer[:data][:attributes] }

  describe 'attributes' do
    it 'includes the full_name attribute' do
      expect(result[:full_name]).to eq("John Doe")
    end

    it 'includes the address_summary attribute' do
      expect(result[:address_summary]).to eq("New York, NY 10001")
    end

    it 'includes standard attributes' do
      expect(result[:id]).to eq(customer.id)
      expect(result[:first_name]).to eq(customer.first_name)
      expect(result[:last_name]).to eq(customer.last_name)
      expect(result[:email]).to eq(customer.email)
      expect(result[:address_city]).to eq(customer.address_city)
      expect(result[:address_state]).to eq(customer.address_state)
      expect(result[:address_zip]).to eq(customer.address_zip)
    end
  end
end
