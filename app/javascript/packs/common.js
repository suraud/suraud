import Axios from 'axios'

export default {
  axios(document) {
    let csrfToken = document.getElementsByName('csrf-token')[0].getAttribute('content')
    return Axios.create({
      headers: {
        'X-CSRF-TOKEN': csrfToken,
        'Accept': 'application/json',
        'access-token': this.accessToken(),
        'client': this.client(),
        'uid': this.uid()
      }
    })
  },
  email() {
    return localStorage.getItem('email')
  },
  saveEmail(email) {
    localStorage.setItem('email', email)
  },
  accessToken() {
    return localStorage.getItem('access-token')
  },
  saveAccessToken(accessToken) {
    localStorage.setItem('access-token', accessToken)
  },
  uid() {
    return localStorage.getItem('uid')
  },
  saveUid(uid) {
    localStorage.setItem('uid', uid)
  },
  role() {
    return localStorage.getItem('role')
  },
  saveRole(role) {
    localStorage.setItem('role', role)
  },
  client() {
    return localStorage.getItem('client')
  },
  saveClient(client) {
    localStorage.setItem('client', client)
  },
  isMobile() {
    return window.innerWidth <= 800
  },
  isPreview() {
    return location.pathname.startsWith('/preview')
  },
  validateTokenInPreview(document, redirect, callback) {
    if (!location.pathname.startsWith('/preview')) {
      callback()
      return
    }
    if (!this.accessToken()) {
      location.href = '/console#/sign_in?redirect=' + redirect
      return
    }
    let params = {
      uid: this.uid(),
      client: this.client(),
      'access-token': this.accessToken()
    }
    this.axios(document).get('/auth/validate_token', params).then(response => {
      console.log(response)
      callback()
    }).catch(error => {
      location.href = '/console#/sign_in?redirect=' + redirect
    })
  }
}
