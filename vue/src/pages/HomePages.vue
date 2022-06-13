<template>
  <div>
    <Navbar />
    <div>
      <b-jumbotron bg-variant="secondary">
        <template #header><span class="font-weight-500">Welcome to DiscussTime</span></template>

        <template #lead>
          DiscussTime adalah website berdiskusi untuk para wibu nolep, kpopers, orang posting icikiwir dan member grup awtis lainnya
        </template>

        <hr class="my-4" />

        <p>
          Mari bergabung dan capailah ke awtisan tanpa batas di <span class="text-uppercase font-weight-500">discuss time</span>
        </p>

        <router-link :to="{name: 'login'}" class="btn btn-primary font-weight-500">Get Started</router-link>
      </b-jumbotron>
    </div>
  </div>
</template>

<script>
import Navbar from "../components/NavigationBar.vue";

export default {
  components: { Navbar },
};
</script>

<style>
  .font-weight-500{
    font-weight: 500;
  }
  
  .font-weight{
    
  }

</style>