<template>
  <div class="container-fluid">
    <div class="row">
      <google-map class="col-md-8" :markers="markers" />
      <div class="col-md-4 overflow-container">
        <create-store-form />
        <store v-for="store in stores.edges" :store="store.node" :key="store.node.id" />
      </div>
    </div>
  </div>
</template>

<script>
import Map from './map.vue';
import Store from './store.vue';
import Form from './form.vue';
import { storesQuery } from './query.js';

export default {
  data: function() {
    return {
      stores: {
        edges: []
      }
    };
  },
  apollo: {
    stores: {
      query: storesQuery
    }
  },
  computed: {
    markers() {
      return this.stores.edges.map(({ node }) => {
        return {
            title: node.name,
            location: { lat: node.latitude, lng: node.longitude }
        }
      });
    }
  },
  components: {
    'google-map': Map,
    'create-store-form': Form,
    store: Store
  }
}
</script>

<style scoped>
.overflow-container {
  height: calc(100vh - 50px);
  overflow-y: scroll;
}
</style>
