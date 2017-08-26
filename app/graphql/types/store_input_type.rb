Types::StoreInputType = GraphQL::InputObjectType.define do
  name 'StoreInput'

  argument :name, !types.String
  argument :description, !types.String
  argument :address, !types.String
  argument :tag_list, types.String
end
