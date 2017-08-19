Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  connection :stores, Types::StoreType.connection_type, max_page_size: 25 do
    resolve ->(_obj, _args, _ctx) { Store.all }
  end

  field :store do
    type Types::StoreType
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Store.find(args['id']) }
  end
end
