import gql from 'graphql-tag'

export const storesQuery = gql`
query Stores($cursor: String) {
  stores(first: 25, after: $cursor) {
    edges {
      node {
        id
        name
        description
        address
        tags {
          name
        }
        latitude
        longitude
      }
    }
    pageInfo {
      endCursor
      hasNextPage
    }
  }
}
`

export const addStoreMutation = gql`
mutation ($name: String!, $description: String!, $address: String!, $tag_list: String) {
  addStore(store: { name: $name, description: $description, address: $address, tag_list: $tag_list}) {
    id
    name
    description
    address
    tags {
      name
    }
    latitude
    longitude
  }
}
`
