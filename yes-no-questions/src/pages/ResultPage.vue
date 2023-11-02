<template>
  <q-page class="flex-center">

    <div class="column items-center">
      <Transition appear name="slide-top-text-effect" mode="out-in">
        <div class="col-11 q-my-lg">
          あなたが聴くべきトークは...
        </div>
      </Transition>
    </div>

    <div class="q-mx-lg">
      <div v-if="isShowTalkCard" class="col-12">
        <Transition appear name="slide-card-effect" mode="out-in">
          <q-card>
            <q-img :src="resultThumbnailBackground">
              <div class="absolute-full text-center flex flex-center result-card-background">
                <div>
                  <div class="text-h6 q-pt-lg text-grey-9">
                    {{ suggestedTalk.title }}
                  </div>
                  <div class="text-subtitle1 q-pa-sm text-grey-8">
                    {{ suggestedTalk.speaker.name }} (@{{ suggestedTalk.speaker.twitter }})さん
                  </div>
                </div>
              </div>
            </q-img>
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
        <div class="row justify-center q-my-md">
          <div class="col-8">
            <q-btn
              color="primary"
              class="full-width"
              stack size="16px"
              icon="𝕏"
              label="結果を共有する"
              :href="tweetHrefUrl"
              target="_blank"
            />
          </div>
        </div>
        <div class="column justify-center">
          <div class="row justify-center q-my-md">
            <div class="col-8">
              <q-btn
                color="primary"
                class="full-width"
                flat
                label="もう一度診断する"
                :to="{name: 'IndexPage'}"
              />
            </div>
          </div>
        </div>
      </div>
    </Transition>

    <BackWebSiteButton />

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import ProposalsData from "../../data/proposals.json"
import ResultThumbnail from "../assets/resultThumbnail.png"
import BackWebSiteButton from "../components/BackWebSiteButton.vue"

export default defineComponent({
  name: 'QuestionPage',
  components: {
    BackWebSiteButton,
  },
  data() {
    return {
      proposals: ProposalsData.proposals,
      isShowTalkCard: false,
      isShowButtons: false,
      resultThumbnailBackground: ResultThumbnail,
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
      const shareUrl = "https://2024.kphpug.jp/?uuid=" + this.suggestedTalk.uuid
      const postMessage = "私におすすめのトークはこれでした!! "
      const hashtags = "phpkansai,ぺちこん関西おすすめトーク診断"
      return "https://twitter.com/share?url=" + shareUrl + "&text=" + postMessage + "&hashtags=" + hashtags
    }
  },
  methods: {
  }
})
</script>
<style scoped>
.result-card {
  max-width: 800px;
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
</style>
