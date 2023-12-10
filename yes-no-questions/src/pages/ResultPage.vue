<template>
  <q-page class="flex-center page">

    <div class="row justify-center">
      <div class="col-xs-11 text-center q-mt-lg">
        <Transition appear name="slide-top-text-effect" mode="out-in">
          <div class="col-11 q-my-lg">
            あなたが聴くべきトークは...
          </div>
        </Transition>
      </div>
    </div>

    <div class="row justify-center q-my-lg">
      <div class="col-xs-11 col-md-7">
        <Transition appear name="slide-card-effect" mode="out-in">
          <q-card v-show="isShowTalkCard">
            <q-img :src="resultThumbnailBackground" >
              <div class="absolute-full text-center flex flex-center result-card-background">
                <div>
                  <div class="text-h5 text-weight-bolder q-pt-lg text-grey-9">
                    {{ suggestedTalk.title }}
                  </div>
                  <div class="text-subtitle1 q-pa-sm text-grey-8">
                    {{ suggestedTalk.speaker.name }} (@{{ suggestedTalk.speaker.twitter }})さん
                  </div>
                </div>
              </div>
            </q-img>
            <div class="memory-chan-stage">
              <img
                  src="~/assets/memory-chan/memory-chan04.png"
                  class="memory-chan04"
              />
            </div>
            <q-card-actions align="center">
              <q-btn
                color="primary"
                class="full-width"
                flat
                label="このトークの詳細を確認する"
                :href="suggestedTalk.url"
                target="fortee"
              />
            </q-card-actions>
          </q-card>
        </Transition>
      </div>
    </div>

    <Transition appear name="slide-buttons-effect" mode="out-in">
      <div v-if="isShowButtons">
        <div class="row justify-center">
          <div class="col-xs-11 col-md-7 text-center">
            <q-btn-dropdown
                split
                color="light-blue-13"
                class="full-width"
                size="20px"
                icon="𝕏"
                label="結果を共有する"
                :href="tweetHrefUrl"
                target="_blank"
            >

              <q-list>
                <q-item clickable v-close-popup @click="resultShareByLine">
                  <q-item-section avatar>
                    <q-avatar>
                      <img src="~/assets/sns/line.png" alt="Line"/>
                    </q-avatar>
                  </q-item-section>
                  <q-item-section>
                    <q-item-label>LINE</q-item-label>
                  </q-item-section>
                </q-item>

                <q-item clickable v-close-popup @click="resultShareByCopy">
                  <q-item-section avatar>
                    <q-avatar icon="content_copy" color="blue-grey-2">
                    </q-avatar>
                  </q-item-section>
                  <q-item-section>
                    <q-item-label>URLコピー</q-item-label>
                  </q-item-section>
                </q-item>
              </q-list>

            </q-btn-dropdown>
          </div>
        </div>

        <div class="row justify-center q-my-lg">
          <div class="col-xs-11 col-md-7 text-center">
            <q-btn
                color="primary"
                class="full-width q-py-md"
                flat
                size="14px"
                label="もう一度診断する"
                :to="{name: 'IndexPage'}"
            />
          </div>
        </div>

        <div class="row justify-center">
          <div class="col-xs-11 col-md-7">
            <q-card class="q-py-md php-con-card">
              <q-item>
                <q-item-section>
                  <q-item-label class="text-center text-h6 text-weight-bold text-orange-10">
                    PHPカンファレンス関西2024は<br/>2024年2月11日（日）開催!!
                  </q-item-label>
                </q-item-section>
              </q-item>
              <q-card-section horizontal class="justify-center">
                <q-img
                    class="col-5 php-con-logo"
                    src="../assets/php_con_logo2024.png"
                    fit="contain"
                />
                <q-card-section class="q-py-xs q-pr-xs">
                  <q-list>
                    <q-item
                        clickable
                        href="https://2024.kphpug.jp/"
                        target="_blank"
                        class="q-px-xs"
                    >
                      <q-item-section avatar>
                        <q-icon color="red-11" name="home" />
                      </q-item-section>
                      <q-item-section>
                        <q-item-label>公式サイト</q-item-label>
                      </q-item-section>
                    </q-item>

                    <q-item
                        clickable
                        href="https://fortee.jp/phpcon-kansai2024/timetable"
                        target="_blank"
                        class="q-px-xs"
                    >
                      <q-item-section avatar>
                        <q-icon color="red-11" name="date_range" />
                      </q-item-section>
                      <q-item-section>
                        <q-item-label>タイムテーブル</q-item-label>
                      </q-item-section>
                    </q-item>

                    <q-item
                        clickable
                        href="https://peatix.com/event/3752841/view?k=480d6bc1430a629adca5b030b2457224a3e4a4c6"
                        target="_blank"
                        class="q-px-xs"
                    >
                      <q-item-section avatar>
                        <q-icon color="red-11" name="confirmation_number" />
                      </q-item-section>
                      <q-item-section>
                        <q-item-label>チケット購入</q-item-label>
                      </q-item-section>
                    </q-item>
                  </q-list>
                </q-card-section>
              </q-card-section>
            </q-card>
          </div>
        </div>
      </div>
    </Transition>

    <SnsButtons />

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import ProposalsData from "../../data/proposals.json"
import ResultThumbnail from "../assets/resultThumbnail.png"
import SnsButtons from "../components/SnsButtons.vue"
import {Notify} from 'quasar'

export default defineComponent({
  name: 'QuestionPage',
  components: {
    SnsButtons,
  },
  data() {
    return {
      proposals: ProposalsData.proposals,
      isShowTalkCard: false,
      isShowButtons: false,
      resultThumbnailBackground: ResultThumbnail,
      buttonLabelMessage: "",
      hideLabel: true,
    }
  },
  mounted : function(){
    // トークカードの表示
    setTimeout(() => {this.isShowTalkCard = true}, 1200)
    // その他ボタンの表示
    setTimeout(() => {this.isShowButtons = true}, 2500)
  },
  computed: {
    suggestedTalk() {
      const suggestedTalkUuid = this.$route.params.uuid
      return this.proposals.find((proposal) => proposal.uuid === suggestedTalkUuid)
    },
    tweetHrefUrl() {
      const shareUrl = this.shareUrl()
      const postMessage = "私におすすめのトークはこれでした!! "
      const hashtags = "phpkansai,ぺちこん関西おすすめトーク診断"
      return "https://twitter.com/share?url=" + shareUrl + "&text=" + postMessage + "&hashtags=" + hashtags
    }
  },
  methods: {
    shareUrl() {
      return "https://2024.kphpug.jp/yntest/results/" + this.suggestedTalk.uuid + ".html"
    },
    resultShareByLine() {
      const message = "PHPカンファレンス関西2024\n【おすすめトーク診断】\n\n私におすすめのトークはこれでした!! \n\n"
          + this.suggestedTalk.title + "\nby " + this.suggestedTalk.speaker.name + "さん\n"
      const url = "https://line.me/R/msg/text/?"
          + encodeURIComponent(message + this.shareUrl())
      window.open(url, "_blank")
    },
    resultShareByCopy() {
      const message = "PHPカンファレンス関西2024\n【おすすめトーク診断】\n\n私におすすめのトークはこれでした!! \n\n"
          + "**" + this.suggestedTalk.title + "**\nby " + this.suggestedTalk.speaker.name + "さん\n"
      navigator.clipboard.writeText(message + this.shareUrl())
      console.log(Notify)
      Notify.create('コピーしました!!')
    },
  }
})
</script>
<style scoped>
.page {
  padding-bottom: 80px;
}

.php-con-card {
  background-color: #fffacd;
}

.php-con-logo {
  max-width: 180px;
}

.result-card-background {
  background:rgba(255,255,255,0.3);
}

.slide-top-text-effect-enter-active {
  transition: all 0.5s ease-out;
}
.slide-top-text-effect-enter-from,
.slide-top-text-effect-leave-to {
  transform: translateY(20px);
  opacity: 0;
}

.slide-card-effect-enter-active {
  transition: all 1.0s ease-out;
}
.slide-card-effect-enter-from,
.slide-card-effect-leave-to {
  transform: translateY(60px);
  opacity: 0;
}

.slide-buttons-effect-enter-active {
  transition: all 0.3s ease-out;
}
.slide-buttons-effect-enter-from,
.slide-buttons-effect-leave-to {
  transform: translateY(20px);
  opacity: 0;
}

.memory-chan-stage {
  position:relative;
  z-index: 20;
}

.memory-chan04 {
  position: absolute;
  bottom: 0px;
  right: 10px;
  width: 25%;
  opacity: 0.9;
  z-index: -1;
}
</style>
