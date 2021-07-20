<template>
  <v-app>
    <router-view></router-view>
    <ud-activity-view ref="udActivityView" />
  </v-app>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

import Common from '../common.js'
import SignIn from './sign_in.vue'
import Home from './home.vue'
import UdActivityView from './ud_activity_view.vue'

Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(Vuetify)

const vuetify = new Vuetify()

let router = new VueRouter({
  routes: [
    { path: '/sign_in', component: SignIn },
    { path: '/', component: Home }
  ]
})

let store = new Vuex.Store({
})

export default {
  router,
  store,
  vuetify,
  components: {
    'ud-activity-view': UdActivityView
  },
  watch: {
    '$route' (to, from) {
      if (!['/sign_in'].includes(to.path)) {
        this.validateToken()
      }
    }
  },
  methods: {
    validateToken() {
      if (!Common.accessToken()) {
        this.$router.push('/sign_in')
        return
      }
      let params = {
        uid: Common.uid(),
        client: Common.client(),
        'access-token': Common.accessToken()
      }
      Common.axios(document).get('/auth/validate_token', params).then(response => {
      }).catch(error => {
        console.log(error)
        if (401 == error.response.status) {
          this.$router.push('/sign_in')
        }
      })
    },
    showActivityView() {
      this.$refs.udActivityView.showView()
    },
    hideActivityView() {
      this.$refs.udActivityView.hideView()
    }
  },
  mounted() {
    if (!['/sign_in'].includes(this.$route.path)) {
      this.validateToken()
    }
  }
}
</script>

<style>
body {
  width: 100%;
  height: 100%;
}
</style>
