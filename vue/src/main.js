import Vue from 'vue'
import App from './App.vue'
import './app.scss';
import VueRouter from 'vue-router';
import router from './routes';
import bootstrap from 'bootstrap-vue'
import VueSweetalert2 from 'vue-sweetalert2'
import 'sweetalert2/dist/sweetalert2.min.css';
import axios from './plugins/axios';
import store from './store'
import loader from "vue-ui-preloader";
/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import specific icons */
import { faUserSecret, faHouse, faUser, faHeart, faArrowRightFromBracket, faEllipsis, faMessage, faCommentDots, faShare, faPhone, faPhoneAlt } from '@fortawesome/free-solid-svg-icons'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'


/* add icons to the library */
library.add(faUserSecret, faHouse, faArrowRightFromBracket, faUser, faEllipsis, faHeart, faMessage, faCommentDots, faShare, faPhone, faPhoneAlt);

/* add font awesome icon component */
Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.use(bootstrap);
Vue.use(VueSweetalert2);
Vue.use(VueRouter);
Vue.use(axios);
Vue.config.productionTip = false
Vue.use(require('vue-moment'));
Vue.use(loader)



new Vue({
  render: h => h(App),
  store,
  components: {
    loader: loader
  },
  router
}).$mount('#app')
