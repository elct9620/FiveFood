<template>
  <div class="card">
    <div class="card-body">
      <h4><a href="#" @click="setLocation">{{ store.name }}</a></h4>
      <span v-for="tag in store.tags" key="tag.name" class="badge badge-primary">{{ $t(`store.tags.${tag.name}`) }}</span>
      <p>{{ store.description }}</p>
      <footer class="blockquote-footer">{{ store.address }}</footer>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {}
  },
  props: {
    store: {
      type: Object,
      default: function() {
        return {
          name: '',
          description: '',
          address: '',
          tags: [],
          latitude: 0,
          longitude: 0
        }
      }
    }
  },
  methods: {
    setLocation(ev) {
      ev.preventDefault();

      // TODO: Refactor to use `$emit` or `vuex`
      if(this.$parent.$refs.map) {
        const newLocation = new google.maps.LatLng(this.store.latitude, this.store.longitude);
        this.$parent.$refs.map.map.panTo(newLocation);
      }
    }
  }
}
</script>

<style scoped>
.card {
  margin-top: 1rem;
}

.badge {
  margin-right: .5rem;
}
</style>
