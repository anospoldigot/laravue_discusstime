import axios from 'axios';

// const instance = axios.create({
//     baseURL: 'http://127.0.0.1:8000/'
// });
const instance = axios.create({
    baseURL: 'https://api.havilaresidence.com'
});
export default {
  install: function(Vue) {
    Object.defineProperty(Vue.prototype, '$axios', { value: instance });
  }
}