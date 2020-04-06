<template>
 <form @submit="submit">
  <table>
    <tr></tr>
    <tr>
      <th>タイトル</th>
      <td><input type="text"></td>
    </tr>
    <tr>
      <th>書籍名</th>
      <td><v-select class="book_select" v-bind:options="title"></v-select></td>
    </tr>
    <tr>
      <th>投稿内容</th>
      <td><textarea></textarea></td>
    </tr>
    <button type="submit">投稿</button>
  </table>
 </form>
</template>

<script>
import Vue from "vue";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
Vue.component("v-select", vSelect);

export default {
  props: {
    title: {
      type: Array,
      default: () => []
    },
    id: {
      type: Array,
      default: () => []
    }
  }
}
</script>

<style scoped>

table {
  width: 50%;
}

td {
  text-align: center;
}

textarea {
  height: 200px;
}

.book_select {
  width: 50%;
  margin: auto;
}

</style>
