class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :cost
end
