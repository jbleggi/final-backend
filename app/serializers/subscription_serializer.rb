class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :cost, :created_at, :updated_at
end
