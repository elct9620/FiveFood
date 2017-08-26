/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'jquery';
import 'bootstrap';

import Vue from 'vue'
import VueApollo from 'vue-apollo'
import VueI18n from 'vue-i18n';
import VueRouter from 'vue-router';

import apolloClient from './apollo.js.erb';
import messages from './locales.js.erb';
import routes from './routes';

import App from './app.vue'

Vue.use(VueApollo);
Vue.use(VueI18n);
Vue.use(VueRouter);

const apolloProvider = new VueApollo({ defaultClient: apolloClient });
const i18n = new VueI18n({ locale: 'zh-TW', fallbackLocale: 'zh-TW', messages });
const router = new VueRouter({ routes });

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    apolloProvider,
    i18n,
    router,
    render: h => h(App)
  }).$mount('#app');
})
