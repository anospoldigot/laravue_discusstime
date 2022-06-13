<template>
  <div>
    <b-navbar toggleable="lg" type="light" variant="white" class="py-3">
      <b-container>
        <b-navbar-brand href="#">DiscussTime</b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto" v-if="isLoggedIn">
            <b-nav-item href="#"
              ><b-button variant="" title="Beranda"
                ><font-awesome-icon icon="fa-solid fa-house" /></b-button
            ></b-nav-item>
            <b-nav-item href="#"
              ><b-button variant="" title="Profile"
                ><font-awesome-icon icon="fa-solid fa-user" /></b-button
            ></b-nav-item>
            <b-nav-item href="#"
              ><b-button variant="" title="Logout" @click="handleLogout"
                ><font-awesome-icon
                  icon="fa-solid fa-arrow-right-from-bracket" /></b-button
            ></b-nav-item>
          </b-navbar-nav>
          <b-navbar-nav class="ml-auto" v-else>
            <b-nav-item href="#"
              ><b-button variant="primary">Sign Up</b-button></b-nav-item
            >
            <b-nav-item href="#"
              ><b-button variant="" @click="test">Sign In</b-button></b-nav-item
            >
          </b-navbar-nav>
        </b-collapse>
      </b-container>
    </b-navbar>
  </div>
</template>

<script>
import { mapGetters, mapMutations } from "vuex";
import Cookie from "js-cookie";
export default {
  methods: {
    handleLogout() {
      Cookie.remove("vuex");
      
      this.$router.push("sign-in");
    },
  },

  computed: {
    ...mapMutations(["setUser", "setToken"]),
    ...mapGetters(["isLoggedIn"]),
  },

  data() {
    return {};
  },
};
</script>

<style>
</style>