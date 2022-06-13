<template>
  <div class="bg-light min-vh-100">
    <Navbar />
    <div class="container-fluid py-5">
      <b-row>
        <b-col cols="" xl="3"></b-col>
        <b-col cols="12" xl="6">
          <div>
            <b-button
              variant="primary"
              v-b-modal.modal-prevent-closing
              class="mb-4"
              >Buat Discuss</b-button
            >
            <b-modal
              id="modal-prevent-closing"
              ref="modal"
              title="Submit Your Discuss"
              ok-title="Kirim"
              :ok-disabled="isSend"
              @ok="handleSubmit"
            >
              <form @submit.prevent="handleSubmit">
                <b-form-group label="Isi Post" label-for="body-input">
                  <b-form-textarea
                    id="body-textarea"
                    v-model="form.body"
                    placeholder="Enter something..."
                    rows="4"
                    max-rows="6"
                  ></b-form-textarea>
                </b-form-group>
              </form>
            </b-modal>
            <div class="text-center" v-if="isLoading">Loading ...</div>
            <div v-else>
              <card-post
                class="mb-3"
                :post="post"
                :comments="post.comments"
                v-for="post in posts"
                :isMyPost="post.user.id == $store.state.user.id ? true : false"
                :key="post.id"
                @deletePost="deletePost(post.id)"
                @saveComment="saveComment(...arguments)"
              />
            </div>
          </div>
        </b-col>
        <div class="col-3">
          <div>
            <b-button v-b-toggle.sidebar-right>Lihat Contact</b-button>
            <b-sidebar id="sidebar-right" title="Contact" right shadow>
              <div class="px-3 py-2">
                <ul>
                  <li
                    class="mb-3"
                    v-for="contact in contacts"
                    :key="contact.id"
                  >
                    {{ contact.name }}
                    <b-button
                      class="float-right"
                      variant="success"
                      size="sm"
                      @click="initiateCall(contact.id)"
                      ><font-awesome-icon icon="fas fa-phone"
                    /></b-button>
                  </li>
                </ul>
              </div>
            </b-sidebar>
          </div>
        </div>
      </b-row>
      <div id="callScreen"></div>
    </div>
  </div>
</template>

<script>
import Navbar from "../components/NavigationBar.vue";
import CardPost from "../components/CardPost.vue";
import { CometChat } from "@cometchat-pro/chat";

const config = {
  headers: {
    Authorization: "Bearer " + localStorage.getItem("token"),
  },
};

export default {
  mounted() {
    this.getPosts();
    this.getContacts();
    this.signUser();
    this.receiveCall();
  },
  components: { Navbar, CardPost },
  methods: {
    async getPosts() {
      this.isLoading = true;
      const response = await this.$axios.get("api/posts", config);
      this.posts = response.data.data;
      this.isLoading = false;
    },

    async getContacts() {
      const response = await this.$axios.get("api/contacts", config);
      this.contacts = response.data.data;
    },

    async deletePost(id) {
      const response = await this.$axios.delete("api/posts/" + id, config);
      if (response.status == 200) {
        this.$swal("Berhasil", "Berhasil Menghapus Post Discuss", "success");
        this.getPosts();
      }
    },

    async saveComment(form) {
      console.log(form);
      const response = await this.$axios.post("api/comments", form, config);
      if (response.status == 201) {
        // this.$swal("Berhasil", "Berhasil Menambahkan Komentar", "success");
        // this.getPosts();
      }
    },

    async handleSubmit() {
      console.log(this);
      try {
        const data = {
          ...this.form,
          user_id: this.$store.state.user.id,
        };

        const response = await this.$axios.post("api/posts", data, config);
        if (response.status == 201) {
          this.$swal("Berhasil", "Berhasil Membuat Post Discuss", "success");
          this.getPosts();
          this.form.body = "";
        }
        // console.log(this.$el.querySelector("b-form-textarea").innerHTML = "");
      } catch (error) {
        console.log(error);
      }
    },
    signUser() {
      let authKey = "a6b5c8ec2ed98eda457a8db33afa61fd9127192d";
      var uid = "discusstime-id-yaspatasu" + this.$store.state.user.id;
      CometChat.getLoggedinUser().then(
        (user) => {
          if (!user) {
            CometChat.login(uid, authKey).then(
              (user) => {
                console.log("Login Successful:", { user });
              },
              (error) => {
                console.log("Login failed with exception:", { error });
              }
            );
          }
        },
        (error) => {
          console.log("Something went wrong", error);
        }
      );
    },
    initiateCall(id) {
      console.log(id);
      var receiverID = "discusstime-id-yaspatasu" + id;
      var callType = CometChat.CALL_TYPE.VIDEO;
      var receiverType = CometChat.RECEIVER_TYPE.USER;

      var call = new CometChat.Call(receiverID, callType, receiverType);

      CometChat.initiateCall(call).then(
        (outGoingCall) => {
          console.log("Call initiated successfully:", outGoingCall);
        },
        (error) => {
          console.log("Call initialization failed with exception:", error);
        }
      );
    },
    receiveCall() {
      const listnerID = "discusstime-id-yaspatasu" + this.$store.state.user.id;
      CometChat.addCallListener(
        listnerID,
        new CometChat.CallListener({
          onIncomingCallReceived: (call) => {
            // this.isIncomingCall = true;
            this.$swal({
              title: "Panggilan Masuk",
              text: call.sender.name,
              iconHtml:
                '<img src="https://img.icons8.com/office/40/undefined/callback.png"/>',
              showDenyButton: true,
              confirmButtonText: "Terima",
              denyButtonText: `Tolak`,
            }).then((result) => {
              /* Read more about isConfirmed, isDenied below */
              if (result.isConfirmed) {
                console.log(this);
                this.acceptCall(call.sessionId);
              } else if (result.isDenied) {
                this.$swal("Changes are not saved", "", "info");
              }
            });
            console.log("Incoming call:", call);
          },
          onOutgoingCallAccepted: (call) => {
            this.startCall(call);
            console.log("Outgoing call accepted:", call);
          },
          onOutgoingCallRejected: (call) => {
            console.log("Outgoing call rejected:", call);
          },
          onIncomingCallCancelled: (call) => {
            console.log("Incoming call calcelled:", call);
          },
        })
      );
    },
    acceptCall(sessionID) {
      CometChat.acceptCall(sessionID).then(
        (call) => {
          this.startCall(call);
          console.log("Call accepted successfully:", call);
        },
        (error) => {
          console.log("Call acceptance failed with error", error);
        }
      );
    },
    rejectCall(sessionID) {
      var status = CometChat.CALL_STATUS.REJECTED;

      CometChat.rejectCall(sessionID, status).then(
        (call) => {
          console.log("Call rejected successfully", call);
        },
        (error) => {
          console.log("Call rejection failed with error:", error);
        }
      );
    },
    startCall(call) {
      var sessionId = call.sessionId;
      var callType = call.type;
      var callSettings = new CometChat.CallSettingsBuilder()
        .setSessionID(sessionId)
        .enableDefaultLayout(true)
        .setIsAudioOnlyCall(callType == "audio" ? true : false)
        .build();
      CometChat.startCall(
        callSettings,
        document.getElementById("callScreen"),
        new CometChat.OngoingCallListener({
          onUserJoined: (user) => {
            console.log("User joined call:", user);
          },
          onUserLeft: (user) => {
            console.log("User left call:", user);
          },
          onUserListUpdated: (userList) => {
            console.log("user list:", userList);
          },
          onCallEnded: (call) => {
            console.log("Call ended:", call);
          },
          onError: (error) => {
            console.log("Error :", error);
          },
          onMediaDeviceListUpdated: (deviceList) => {
            console.log("Device List:", deviceList);
          },
          onUserMuted: (userMuted, userMutedBy) => {
            // This event will work in JS SDK v3.0.2-beta1 & later.
            console.log("Listener => onUserMuted:", userMuted, userMutedBy);
          },
          onScreenShareStarted: () => {
            // This event will work in JS SDK v3.0.3 & later.
            console.log("Screen sharing started.");
          },
          onScreenShareStopped: () => {
            // This event will work in JS SDK v3.0.3 & later.
            console.log("Screen sharing stopped.");
          },
        })
      );
    },
  },
  computed: {
    isSend() {
      return this.form.body == "" ? true : false;
    },
  },
  data() {
    return {
      posts: [],
      contacts: [],
      form: {
        body: "",
      },
      isLoading: false,
      isIncomingCall: false,
    };
  },
};
</script>

<style scoped>
.min-vh-100 {
  min-height: 100vh;
}
.call-animation {
  background: #fff;
  width: 135px;
  height: 135px;
  position: relative;
  margin: 0 auto;
  border-radius: 100%;
  border: solid 5px #fff;
  animation: play 2s ease infinite;
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  -ms-backface-visibility: hidden;
  backface-visibility: hidden;
}
img {
  width: 135px;
  height: 135px;
  border-radius: 100%;
  position: absolute;
  left: 0px;
  top: 0px;
}
@keyframes play {
  0% {
    transform: scale(1);
  }
  15% {
    box-shadow: 0 0 0 5px rgba(255, 255, 255, 0.4);
  }
  25% {
    box-shadow: 0 0 0 10px rgba(255, 255, 255, 0.4),
      0 0 0 20px rgba(255, 255, 255, 0.2);
  }
  25% {
    box-shadow: 0 0 0 15px rgba(255, 255, 255, 0.4),
      0 0 0 30px rgba(255, 255, 255, 0.2);
  }
}
</style>