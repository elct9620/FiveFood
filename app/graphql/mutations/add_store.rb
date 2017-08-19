Mutations::AddStore = GraphQL::ObjectType.define do
  name 'AddStore'

  field :addStore, Types::StoreType do
    argument :store, Types::StoreInputType

    resolve ->(_obj, args, _ctx) { Store.create!(args[:store].to_h) }
  end
end
