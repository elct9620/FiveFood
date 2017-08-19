FiveFoodSchema = GraphQL::Schema.define do
  query(Types::QueryType)

  mutation Mutations::AddStore

  rescue_from(ActiveRecord::RecordNotFound) { 'Not found' }
end
