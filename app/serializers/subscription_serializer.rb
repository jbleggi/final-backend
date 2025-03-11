class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :cost, :customer_id
end
