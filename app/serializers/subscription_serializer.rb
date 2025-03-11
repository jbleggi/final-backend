class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :cost

  has_many :items, serializer: ItemSerializer
  belongs_to :customer, serializer:CustomerSerializer
end
