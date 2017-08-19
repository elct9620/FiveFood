<template>
  <form @submit="addStore">
    <div class="form-group">
      <label for="name">Name</label>
      <input type="text" class="form-control" name="name" v-model="name" placeholder="Store Name" tabindex="1" />
    </div>
    <div class="form-group">
      <label for="address">Address</label>
      <input type="text" class="form-control" name="address" v-model="address" placeholder="Store Address" tabindex="2" />
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea class="form-control" name="description" v-model="description" placeholder="Describe this store" tabindex="3"></textarea>
    </div>
    <button type="submit" class="btn btn-primary" tabindex="4">Add</button>
  </form>
</template>

<script>
import { storesQuery, addStoreMutation } from './query';

export default {
  data: function() {
    return {
      name: '',
      description: '',
      address: ''
    }
  },
  methods: {
    addStore(ev) {
      ev.preventDefault()

      const name = this.name;
      const description = this.description;
      const address = this.address;

      this.name = '';
      this.description = '';
      this.address = '';

      this.$apollo.mutate({
        mutation: addStoreMutation,
        variables: {
          name: name,
          description: description,
          address: address
        },
        update: (store, { data: { addStore } }) => {
          const data = store.readQuery({ query: storesQuery })
          data.stores.edges.unshift({ node: addStore, __typename: 'StoreEdge' })
          store.writeQuery({ query: storesQuery, data })
        },
        optimisticResponse: {
          __typename: 'Mutation',
            addStore:{
              __typename: 'Store',
                id: -1,
                name: name,
                description: description,
                address: address,
                latitude: 0,
                longitude: 0
            }
        }
      })
        .catch(error => {
          console.error(error)
          this.name= name;
          this.description = description;
          this.address = address;
        })
    }
  }
}
</script>

<style scoped>
form {
  margin-top: 1rem;
}
</style>

