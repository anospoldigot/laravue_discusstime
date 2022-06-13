<template>
  <div>
    <b-card header-tag="header" footer-tag="footer" class="">
      <template #header>
        <div class="d-flex justify-content-between">
          <div>
            <b-img
              class="mb-2"
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3HDGpR4ylYg0Mwrg2NHEnwMUwwkYVD494bC3kCwhXAxaR88nvMo_QQqfeahVZ4xnXUJw&usqp=CAU"
              v-bind="mainProps"
              rounded="circle"
              alt="Circle image"
            ></b-img>
            <h6 class="mb-2">{{ post.user.name }}</h6>
            <small class="text-muted">
              {{ post.created_at | moment("from", "now") }}</small
            >
          </div>
          <div>
            <b-dropdown
              size="lg"
              variant="link"
              toggle-class="text-decoration-none"
              no-caret
            >
              <template #button-content>
                <font-awesome-icon icon="fa-solid fa-ellipsis" />
              </template>
              <b-dropdown-item v-if="isMyPost" @click="$emit('deletePost')"
                >Hapus Post</b-dropdown-item
              >
              <b-dropdown-item>Save Discuss</b-dropdown-item>
            </b-dropdown>
          </div>
        </div>
      </template>
      <b-card-text>{{ post.body }}</b-card-text>
      <template #footer>
        <b-button-group class="w-100 border-0">
          <b-button class="loveButton"
            ><font-awesome-icon icon="fa-solid fa-heart" /> Sukai</b-button
          >
          <b-button v-b-toggle.collapse-1
            ><font-awesome-icon icon="fa-solid fa-comment-dots" />
            Komentar</b-button
          >
          <b-button><font-awesome-icon icon="fas fa-share" /> Bagikan</b-button>
        </b-button-group>
      </template>
    </b-card>
    <b-collapse id="collapse-1" class="mb-2">
      <b-card>
        <p class="card-text mb-4">Komentar</p>
        <b-row class="mb-3" v-for="comment in post.comments" :key="comment.id">
          <b-col cols="2">

          </b-col>
          <b-col cols="10">
            <div class="card border-0 m-0 p-0">
              <div
                class="balon2 p-2 m-0 position-relative"
                :data-name="comment.user.name+', '"
                :data-is="comment.created_at | moment('from', 'now')"
              >
                <span class="float-left sohbet2">
                  {{ comment.comment }}
                </span>
              </div>
            </div>
          </b-col>
        </b-row>
        <b-row class="mb-3" v-for="comment in myComment" :key="comment.id">
          <b-col cols="2">

          </b-col>
          <b-col cols="10">
            <div class="card border-0 m-0 p-0">
              <div
                class="balon2 p-2 m-0 position-relative"
                :data-name="$store.state.user.name+', '"
                :data-is="comment.created_at | moment('from', 'now')"
              >
                <span class="float-left sohbet2">
                  {{ comment.comment }}
                </span>
              </div>
            </div>
          </b-col>
        </b-row>
        <div class="text-center my-4" v-if="isLoadComment">
          <small>Loading...</small>
        </div>
        <form @submit.prevent="saveComment">
          <b-form-textarea
            id="textarea-default"
            placeholder="Tulis Komentar"
            rows="3"
            class="mb-1"
            v-model="form.comment"
          ></b-form-textarea>
          <b-button variant="primary" type="submit" :disabled="isSendComment">Kirim</b-button>
        </form>
      </b-card>
    </b-collapse>
  </div>
</template>

<script>

export default {
  props: ["post", "isMyPost"],
  methods: {
    saveComment() {
      const data = {
        id: (this.myComment.length + this.post.length) + 1,
        comment: this.form.comment,
        created_at: new Date()
      }
      this.myComment.push(data);
      this.$emit("saveComment", this.form);
      this.form.comment = "";
    },
  },
  computed: {
    isSendComment(){
      return this.form.comment == "" ? true : false
    }
  },
  data() {
    return {
      mainProps: { width: 50 },
      // commentProps: { width: 40 },
      form: {
        user_id: this.$store.state.user.id,
        post_id: this.post.id,
        comment: "",
      },
      myComment: []
    };
  },
};
</script>

<style scoped>

.card::-webkit-scrollbar {
  width: 1px;
}

::-webkit-scrollbar-thumb {
  border-radius: 9px;
  background: rgba(96, 125, 139, 0.99);
}

.balon1,
.balon2 {
  margin-top: 5px !important;
  margin-bottom: 5px !important;
}

.balon2 span {
  background: #f1f1f1;
  color: #000 !important;
  border-radius: 20px 20px 20px 3px;
  display: block;
  max-width: 75%;
  padding: 7px 13px 7px 13px;
}

.balon2:before {
  content: attr(data-name)  attr(data-is);
  position: absolute;
  left: 13px;
  bottom: -0.8em;
  display: block;
  font-size: 0.75rem;
  color: rgba(84, 110, 122, 1);
}
</style>