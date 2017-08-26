Types::TagType = GraphQL::ObjectType.define do
  name 'Tag'

  field :name, !types.String
end
