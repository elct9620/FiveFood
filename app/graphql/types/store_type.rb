Types::StoreType = GraphQL::ObjectType.define do
  name 'Store'

  field :id, !types.Int
  field :name, !types.String
  field :description, !types.String
  field :address, !types.String
  # TODO: Fix N+1 Query
  field :tags, types[Types::TagType]
  field :latitude, types.Float
  field :longitude, types.Float
end
