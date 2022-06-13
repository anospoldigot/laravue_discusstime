import VueRouter from 'vue-router'

const routes = [
    {
        path: '/',
        component: () => import('../pages/HomePages.vue')
    },
    {
        path: '/beranda',
        name: 'beranda',
        meta: { requiresAuth: true },
        component: () => import('../pages/BerandaPages.vue')
    },
    {
        path: '/sign-in',
        name: 'login',
        component: () => import('../pages/SignIn.vue')
    }
]

const router = new VueRouter({
    mode: 'history',
    routes // short for `routes: routes`
})


router.beforeEach((to, from, next) => {
    if (to.meta.requiresAuth) {
        if(router.app.$store.getters.isLoggedIn){
            next();
        }else{
            next({ name: 'login'}) 
        }
    } else {
        next()
    }
})
export default router;