class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :address_city, :address_state, :address_zip

  attribute :full_name do |customer|
    "#{customer.first_name} #{customer.last_name}"
  end

  attribute :address_summary do |customer|
    "#{customer.address_city}, #{customer.address_state} #{customer.address_zip}"
  end
end