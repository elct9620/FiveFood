<template>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <router-link class="navbar-brand" to="/" extact>
    <img :src="logo" :alt="$t('site.name')" height="30" />
  </router-link>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="main-menu">
    <ul class="navbar-nav ml-auto">
      <nav-link to="/" exact>{{ $t('navbar.home') }}</nav-link>
      <nav-link to="/stores">{{ $t('navbar.stores') }}</nav-link>
    </ul>
  </div>
</nav>
</template>

<script>
import logo from '../assets/logo-white.svg';

import NavLink from './nav-link.vue';

export default {
  data: function() {
    return {
      logo,
    };
  },
  components: {
    'nav-link': NavLink
  }
}
</script>
