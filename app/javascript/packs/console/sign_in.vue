<template>
  <div class="ud-sign-in">
    <div class="ud-content">


      <div class="ud-title-row">
        <h3>COPORATE</h3>
      </div>


      <v-form @submit="onSubmit">

        <v-alert :value="errors != null" transition="scale-transition">
          <ul><li v-for="e in errors">{{ e }}</li></ul>
        </v-alert>

        <div>
          <v-text-field label="EMAIL" v-model="email" type="email" clearable></v-text-field>
        </div>

        <div>
          <v-text-field
            label="PASSWORD"
            v-model="password"
            :type="showPassword ? 'text' : 'password'"
            :append-icon="showPassword ? 'visibility' : 'visibility_off'"
            @click:append="showPassword = !showPassword"
          ></v-text-field>
        </div>

        <div class="ud-button-row">
          <v-btn large depressed type="submit" class="ud-button" color="#E94A1F" dark>Sign in</v-btn>
        </div>

      </v-form>


      <div>
        <a @click="$router.push('/forgot_password')">Forgot your password?</a>
      </div>

    </div>
  </div>
</template>

<script>
import Common from '../common.js'
export default {
  data() {
    return {
      showPassword: false,
      email: Common.email(),
      password: '',
      errors: null
    }
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault()
      this.errors = null
      let params = {
        email: this.email,
        password: this.password
      }
      this.$root.showActivityView()
      Common.axios(document).post('/auth/sign_in', params).then(response => {
        Common.saveEmail(this.email)
        Common.saveAccessToken(response.headers['access-token'])
        Common.saveUid(response.headers['uid'])
        Common.saveClient(response.headers['client'])
        Common.saveRole(response.data.data.role)
        this.$root.hideActivityView()
        if (this.$route.query.redirect) {
          location.href = this.$route.query.redirect
          return
        }
        this.$router.push('/')
      }).catch(error => {
        this.errors = error.response.data.errors
        this.$root.hideActivityView()
      })
    }
  },
  mounted() {
    console.log(this.$route)
  }
}
</script>

<style scoped lang="scss">
@import "console.scss";
.ud-sign-in {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  .ud-content {
    width: 320px;
    .ud-title-row {
      width: 100%;
      margin: 0 0 64px;
      h3 {
        @include font-nimbus-sans-extd();
        color: $ud-color-red;
      }
    }
    .ud-button-row {
      margin: 32px 0 32px;
      width: 100%;
      .ud-button {
        width: 84%;
      }
    }
    a {
      text-decoration: underline;
      color: $ud-color-red;
    }
  }
}
</style>
