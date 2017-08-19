<template>
  <div class="card">
    <div class="card-body">
      <h4>{{ store.name }}</h4>
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
          latitude: 0,
          longitude: 0
        }
      }
    }
  }
}
</script>

<style scoped>
.card {
  margin-top: 1rem;
}
</style>
