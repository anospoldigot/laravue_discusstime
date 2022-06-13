<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import {CometChat} from '@cometchat-pro/chat'
export default {
  mounted() {
    this.cometInit();
  },
  methods: {
    cometInit() {
      const appID = "21176660f111440b";
      const region = "us";
      let appSetting = new CometChat.AppSettingsBuilder()
        .subscribePresenceForAllUsers()
        .setRegion(region)
        .autoEstablishSocketConnection(true)
        .build();
      CometChat.init(appID, appSetting).then(
        () => {
          console.log("Initialization completed successfully");
        },
        (error) => {
          console.log("Initialization failed with error:", error);
        }
      );
    },
  },
};
</script>

<style>
</style>
