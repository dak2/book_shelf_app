<template>
 <form>
  <table>
    <tr></tr>
    <tr>
      <th>タイトル</th>
      <td><input type="text" v-model="postTitle"></td>
    </tr>
    <tr>
      <th>書籍名</th>
      <td><v-select class="book_select" :options="books" :reduce="title => title.id" label="title" v-model="selectedBookId"></v-select></td>
    </tr>
    <tr>
      <th>投稿内容</th>
      <td><textarea v-model="postCotent"></textarea></td>
    </tr>
    <button type="submit" @click="createPost">投稿</button>
  </table>
 </form>
</template>

<script>
import Vue from "vue";
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
Vue.component("v-select", vSelect);
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  data() {
    return {
      postTitle: '',
      selectedBookId: 0,
      postCotent: ''
    }
  },
  props: {
    books: {
      type: Array,
      default: () => []
    }
  },

  methods: {
    createPost: function() {
      axios
        .post('/posts.json', { title: this.postTitle, content: this.postCotent, book_id: this.selectedBookId })
        .then(res => {
          console.log(res.data);
          window.location = `/posts/${res.data.id}`
        })
        .catch(error => {
          console.log(error)
        })
    }
  }
}
</script>

<style scoped>

table {
  width: 50%;
  margin: auto;
}

td {
  text-align: center;
}

textarea {
  height: 200px;
}

.book_select {
  width: 100%;
  margin: auto;
}

</style>
