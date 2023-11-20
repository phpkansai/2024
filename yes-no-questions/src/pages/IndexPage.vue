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

          <div class="col-xs-11 col-md-5 ">
            <div class="row justify-center">
              <div class="col-xs-11 col-md-11 text-center q-mx-lg">
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

    <SnsButtons />

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
