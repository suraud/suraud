<template>
  <div class="ud-activity-view" v-if="show">
    <div>
      <v-progress-circular
        indeterminate
        color="primary"
        :size="88"
        :width="2"
      ></v-progress-circular>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      show: false,
    }
  },
  methods: {
    showView() {
      this.show = true
    },
    hideView() {
      this.show = false
    }
  }
}
</script>

<style scoped lang="scss">
.ud-activity-view {
  position: fixed;
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(255, 255, 255, 0.5);
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
