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
      <div class="col-xs-11 text-center q-my-lg">

        <div class="row justify-center">
          <div class="col-xs-12 col-md-5 text-center q-my-md">
            <q-intersection transition="scale" once>
              <img
                v-show="!loading"
                alt="おすすめトーク診断"
                src="~assets/logo.png"
                @load="hideLoad"
                style="width:100%; max-width: 320px; border-radius: 15px;"
              >
            </q-intersection>
          </div>


          <div class="col-xs-12 col-md-5 q-my-md memory-chan-stage">
            <div class="row justify-center">
              <div class="col-xs-12 col-md-12 text-center">
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
                <p class="">
                  <span class="section-title text-h6 text-weight-bold text-orange-8">
                    あなたにぴったりのトークは？
                  </span>
                </p>
                <p>
                  PHPカンファレンス関西2024の当日にどのトークを聞けばいいか迷っていませんか？
                  簡単な質問に答えるだけで、あなたにぴったりのトークをめもりーちゃんが診断します。
                  聞くべきトークを見つけて、PHPカンファレンス関西2024を楽しみましょう！
                </p>
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-11 q-mx-md q-my-md">
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
              <div class="col-xs-12 col-md-12 text-center q-mx-lg q-mt-lg">
                <p class="text-caption text-grey-7">
                  本診断はPHPカンファレンス関西2024実行委員会がトークのプロポーザルを元に作成したものです。実際の発表内容と異なる場合がありますので、あらかじめご了承ください。
                </p>
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-11 q-mt-sm q-mx-md">
                <back-web-site-button />
              </div>
            </div>
          </div>

        </div>

      </div>

      <div class="col-10 text-center q-mb-xs q-mx-md q-mt-lg">
        <p class="">
          <span class="section-title text-h6 text-weight-bold text-orange-8">
            使い方
          </span>
        </p>
      </div>
      <q-card class="bg-orange-3 text-grey-9 col-xs-11 col-md-3 text-center q-mb-md q-mx-md">
        <q-card-section>
          <q-icon name="looks_one" size="50px" color="orange-10" />
          <div class="text-h5 text-orange-10">トーク診断を受ける</div>
        </q-card-section>
        <q-card-section class="q-pt-none">
          まずは自分が診断を受けて、当日聞くべきトークを見つけましょう！
        </q-card-section>
      </q-card>
      <q-card class="bg-orange-3 text-grey-9 col-xs-11 col-md-3 text-center q-mb-md q-mx-md">
        <q-card-section>
          <q-icon name="looks_two" size="50px" color="orange-10" />
          <div class="text-h5 text-orange-10">結果をXにポスト</div>
        </q-card-section>
        <q-card-section class="q-pt-none">
          みんなで結果を見て盛り上がりましょう!!<br>
          <span class="text-weight-bold q-py-xs">
            ハッシュタグ：
          </span>
          <a
              class="text-weight-bold q-py-xs text-light-blue-14 text-decoration-none"
              href="https://twitter.com/search?q=%23%E3%83%88%E3%83%BC%E3%82%AF%E8%A8%BA%E6%96%AD"
              target="_blank"
          >
            #トーク診断
          </a>
        </q-card-section>
      </q-card>
      <q-card class="bg-orange-3 text-grey-9 col-xs-11 col-md-3 text-center q-mb-md q-mx-md">
        <q-card-section>
          <q-icon name="looks_3" size="50px" color="orange-10" />
          <div class="text-h5 text-orange-10">周りに診断を勧める</div>
        </q-card-section>
        <q-card-section class="q-pt-none">
          カンファレンスに慣れていない人が迷わないよう、診断を紹介しましょう！
        </q-card-section>
      </q-card>

      <div class="col-10 text-center q-mb-xs q-mx-md q-mt-lg">
        <p class="">
          <span class="section-title text-h6 text-weight-bold text-orange-8">
            めもりーちゃんについて
          </span>
        </p>
      </div>

      <q-card class="bg-orange-1 text-grey-10 col-xs-11 col-md-6 text-center q-mb-md q-mx-md q-py-md">
        <q-card-section>
          <div class="text-h6 text-orange-10">ちょうぜつエンジニア<br>めもりーちゃん とは</div>
        </q-card-section>
        <q-card-section class="q-pt-none">
          田中ひさてる氏（
          <a
              class="text-light-blue-14 text-decoration-none"
              href="https://twitter.com/tanakahisateru"
              target="_blank"
          >
            @tanakahisateru
          </a>
          ）がX（旧Twitter）で連載しているITエンジニア向けWeb漫画。
          2020年にはSoftware Design誌で連載もされている。
          関連書籍に同氏の「ちょうぜつソフトウェア設計入門――PHPで理解するオブジェクト指向の活用」（技術評論社）がある。
        </q-card-section>
      </q-card>

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
  padding-bottom: 80px;
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

.section-title {
  padding: 5px 20px 5px 20px;
  border-top: 3px dashed #ff955f;
  border-bottom: 3px dashed #ff955f;
}

.text-decoration-none {
  text-decoration-line: none;
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
