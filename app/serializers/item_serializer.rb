class ItemSerializer
  include JSONAPI::Serializer
  attributes :name, :number_bags, :cost, :image_url
end