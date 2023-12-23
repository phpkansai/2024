<template>
  <div class="fullscreen bg-deep-orange-3 text-white text-center q-pa-md">
    <div>
      <div style="font-size: 3vh">
        404
      </div>

      <div class="text-h5" style="opacity:.4">
        お探しのページは見つかりません。
      </div>

      <q-btn
        class="q-my-md"
        color="white"
        text-color="white"
        outline
        :to="{name: 'IndexPage'}"
        label="診断トップに戻る"
        no-caps
      />
    </div>
    <CardGame style="width: 100%;"/>
  </div>
</template>

<script>
import CardGame from "../components/CardGame.vue";
import {defineComponent} from "vue";

export default defineComponent({
  name: 'ErrorNotFound',
  components: {
    CardGame
  },

})
</script>
