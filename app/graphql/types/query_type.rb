Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  connection :stores, Types::StoreType.connection_type, max_page_size: 25 do
    argument :tagged, types.String

    resolve lambda { |_obj, args, _ctx|
      stores = Store.all
      stores = stores.tagged_with(args[:tagged]) if args[:tagged]
      stores
    }
  end

  field :store do
    type Types::StoreType
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Store.find(args['id']) }
  end
end
