<template>
  <form @submit="addStore">
    <div class="form-group">
      <label for="name">{{ $t('store.name') }}</label>
      <input type="text" class="form-control" name="name" v-model="name" :placeholder="$t('store.placeholder.name')" tabindex="1" />
    </div>
    <div class="form-group">
      <label for="address">{{ $t('store.address') }}</label>
      <input type="text" class="form-control" name="address" v-model="address" :placeholder="$t('store.placeholder.address')" tabindex="2" />
    </div>
    <div class="form-group">
      <label for="description">{{ $t('store.description') }}</label>
      <textarea class="form-control" name="description" v-model="description" :placeholder="$t('store.placeholder.description')" tabindex="3"></textarea>
    </div>
    <button type="submit" class="btn btn-primary" tabindex="4">{{ $t('store.submit') }}</button>
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

