Types::StoreType = GraphQL::ObjectType.define do
  name 'Store'

  field :id, !types.Int
  field :name, !types.String
  field :description, !types.String
  field :address, !types.String
  field :latitude, types.Float
  field :longitude, types.Float
end
