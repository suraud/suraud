import Vue from 'vue'
import App from './app.vue'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('suraud'))
  const app = new Vue(App).$mount('suraud')
})
