<template>
  <div class="map"></div>
</template>

<script>
export default {
  data: function() {
    return {
      markersInstance: [],
      map: null
    }
  },
  props: {
    options: {
      type: Object,
      default: function() {
        return {
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
        }
      }
    },
    markers: {
      type: Array,
      default: function() {
        return [];
      }
    }
  },
  methods: {
    loadCurrentPosition() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
          const initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          this.map.setCenter(initialLocation);
        });
      }
    },
    buildMarkers() {
      this.markers.map(marker => {
        if (!marker.location.lat || !marker.location.lng) {
          return;
        }
        this.markersInstance.push(
          new google.maps.Marker({
            position: marker.location,
            map: this.map,
            title: marker.title
          })
        )
      });
    }
  },
  mounted() {
    this.map = new google.maps.Map(this.$el, this.options);
    if(!this.options.center) {
      this.loadCurrentPosition();
    }
    this.buildMarkers();
  },
  watch: {
    markers() {
      this.buildMarkers();
    }
  }
}
</script>

<style scoped>
.map {
  height:  calc(100vh - 50px);
}
</style>
