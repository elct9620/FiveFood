<template>
  <div>
    <navigation />
    <router-view />
  </div>
</template>

<script>
import Navigation from './shared/navigation.vue';

export default {
  data: function () {
    return {
    }
  },
  components: {
    navigation: Navigation
  }
}
</script>

<style scoped>
</style>
