<template>
  <router-link tag="li" class="nav-item" active-class="active" :to="to" :exact="exact">
    <a class="nav-link"><slot /></a>
  </router-link>
</template>

<script>
export default {
  data: function() {
    return {
    };
  },
  props: {
    to: {
      type: String,
      default: ''
    },
    exact: {
      type: Boolean,
      default: false
    }
  }
}
</script>
