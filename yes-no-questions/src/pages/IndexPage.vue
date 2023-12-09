<template>
  <q-page class="">
    <div class="row justify-center">
      <div class="col-xs-11 text-center q-my-md q-mt-lg-md">

        <div class="row justify-center">
          <div class="col-xs-11 col-md-5 text-center q-my-md">
            <img
              alt="おすすめトーク診断"
              src="~assets/logo.png"
              style="width:100%; max-width: 300px; border-radius: 15px;"
            >
          </div>

          <div class="col-xs-11 col-md-5 memory-chan-stage">
            <div class="row justify-center">
              <div class="col-xs-11 col-md-11 text-center q-mx-lg">
                <img
                    src="~/assets/memory-chan/memory-chan01.png"
                    class="memory-chan01"
                />
                <img
                    src="~/assets/memory-chan/memory-chan02.png"
                    class="memory-chan02"
                />
                <p class="text-h6">あなたにぴったりのトークは？</p>
                <p>
                  2/11（日）にどのトークを聞けばいいか迷っていませんか？
                  簡単な質問に答えるだけで、あなたにぴったりのトークを診断します。
                  聞くべきトークを見つけて、PHPカンファレンス関西2024を楽しみましょう！
                </p>
                <p class="text-caption text-grey-7">
                  本診断はPHPカンファレンス関西2024実行委員会が作成したものです。実際の発表内容と異なる場合があります。
                </p>
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-11 q-mx-md">
                <q-btn
                  :to="{name: 'QuestionsPage'}"
                  push
                  class="full-width"
                  color="white"
                  size="22px"
                  text-color="primary"
                  label="診断開始"
                />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-11 q-mt-lg q-mx-md">
                <back-web-site-button />
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>

    <SnsButtons class="float-button"/>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import BackWebSiteButton from "../components/BackWebSiteButton.vue"
import SnsButtons from "../components/SnsButtons.vue"

export default defineComponent({
  name: 'IndexPage',
  components: {
    BackWebSiteButton,
    SnsButtons,
  },
})
</script>

<style scoped>
.memory-chan-stage {
  position:relative;
  z-index: 10;
}
.memory-chan01 {
  position: absolute;
  top: 10%;
  right: -6%;
  width: 80px;
  opacity: 0.4;
  z-index: -1;
}
.memory-chan02 {
  position: absolute;
  top: 35%;
  left: -9%;
  width: 80px;
  opacity: 0.4;
  z-index: -1;
}

.float-button {
  z-index: 10;
}

</style>
