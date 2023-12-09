<template>
  <q-page class="page">
    <div
      v-if="loading"
      class="loadingCover"
    />
    <div
        v-if="loadingQuestion"
        class="loadingCover"
    >
      <div class="absolute-center">
        <img
            src="~/assets/memory-chan/memory-chan01.png"
            class="zoom-memory-chan zoom-in"
            alt="START!!"
        >
      </div>
    </div>

    <div class="row justify-center">
      <div class="col-xs-11 text-center q-my-md q-mt-lg-md">

        <div class="row justify-center">
          <div class="col-xs-11 col-md-5 text-center q-my-md">
            <q-intersection transition="scale">
              <img
                v-show="!loading"
                alt="おすすめトーク診断"
                src="~assets/logo.png"
                @load="hideLoad"
                style="width:100%; max-width: 300px; border-radius: 15px;"
              >
            </q-intersection>
          </div>

          <q-intersection transition="fade">
            <div class="col-xs-11 col-md-5 memory-chan-stage">
              <div class="row justify-center">
                <div class="col-xs-11 col-md-11 text-center q-mx-lg">
                  <img
                      src="~/assets/memory-chan/memory-chan01.png"
                      class="memory-chan01 anime-fuwafuwa1"
                      alt="ちょうぜつエンジニア"
                  />
                  <img
                      src="~/assets/memory-chan/memory-chan02.png"
                      class="memory-chan02 anime-fuwafuwa2"
                      alt="ちょうぜつエンジニア"
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
                    @click="goToQuestionsPage"
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
          </q-intersection>

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
import {Loading, QSpinnerPuff} from 'quasar'

export default defineComponent({
  name: 'IndexPage',
  data() {
    return {
      loading: true,
      loadingQuestion: false,
    }
  },
  mounted : function(){
    Loading.show({
      spinner: QSpinnerPuff,
      backgroundColor: 'deep-orange-2',
      messageColor: 'brown-8',
      spinnerColor: 'white',
    })
  },
  watch: {
    loading: function (val) {
      if (!val) {
        Loading.hide()
      }
    }
  },
  components: {
    BackWebSiteButton,
    SnsButtons,
  },
  methods: {
    hideLoad() {
      this.loading = false
    },
    goToQuestionsPage() {
      this.loadingQuestion = true
      setTimeout(() => {
        this.$router.push({name: 'QuestionsPage'})
      }, 2500)

    },
  },
})
</script>

<style scoped>
.page {
  overflow-x: hidden;
}

.loadingCover {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #faefec;
  z-index: 100;
}

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

@keyframes fuwafuwa1 {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translate(2px, -10px);
  }
}
.anime-fuwafuwa1 {
  animation: 7s fuwafuwa1 infinite;
}
@keyframes fuwafuwa2 {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translate(-2px, 8px);
  }
}
.anime-fuwafuwa2 {
  animation: 7s fuwafuwa2 infinite;
}

.zoom-memory-chan {

}

@keyframes zoom-in-anime1{
  0% {
    transform: scale(0.7);
    opacity: 0;
  }
  10% {
    transform: scale(0.7);
    opacity: 0;
  }
  15% {
    transform: scale(0.5);
    opacity: 0.9;
  }
  80% {
    transform: scale(0.8);
    opacity: 1;
  }
  100% {
    transform: scale(1.5);
    opacity: 0.0;
  }
}


.zoom-in{
  width: 200px;
  animation:
      zoom-in-anime1 1.8s linear forwards alternate;
}

</style>
