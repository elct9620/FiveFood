<template>
  <div>
    <div class="hero" :style="{'background-image': `url(${heroImage})`}">
      <div class="description">
        <img class="logo" :src="logo" :alt="$t('site.name')" />
        <p>{{ $t('site.description') }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import logo from '../assets/logo-white.svg';
import heroImage from './assets/hero.jpg';

export default {
  data: function() {
    return {
      logo,
      heroImage
    };
  }
}
</script>

<style lang="scss" scoped>
.hero {
  background-size: cover;
  background-repeat: no-repeat;

  padding-top: calc(100vh - 50px);
}

.description {
  position: absolute;

  top: 50%;
  left: 50%;

  color: white;
  text-align: center;

  transform: translate(-50%, -50%);

  p {
    margin-top: 1rem;
  }
}
</style>
