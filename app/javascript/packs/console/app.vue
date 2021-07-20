<template>
  <v-app>
    <router-view></router-view>
  </v-app>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

import Home from './home.vue'

Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(Vuetify)

const vuetify = new Vuetify()

let router = new VueRouter({
  routes: [
    { path: '/', component: Home }
  ]
})

let store = new Vuex.Store({
})

export default {
  router,
  store,
  vuetify
}
</script>

<style>
body {
  width: 100%;
  height: 100%;
}
</style>
