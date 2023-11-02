<template>
  <q-page class="flex-center">
    <div class="row justify-center">
      <Transition appear name="slide-top-text-effect" mode="out-in">
        <div class="col-11 q-my-lg" align="center">
          あなたが聴くべきトークは...
        </div>
      </Transition>

      <div v-if="isShowTalkCard" class="col-11">
        <Transition appear name="slide-card-effect" mode="out-in">
          <q-card>
            <img :src="'./results/' + suggesttedTalk.uuid + '.png'">
            <q-card-actions align="center">
              <q-btn
                color="primary"
                class="full-width"
                flat
                label="このトークの詳細を確認する"
                :href="suggesttedTalk.url"
                target="fortee"
              />
            </q-card-actions>
          </q-card>
        </Transition>
      </div>
    </div>

    <Transition appear name="slide-buttons-effect" mode="out-in">
      <div v-if="isShowButtons">
        <div class="row justify-center q-my-md" align="center">
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
        <div class="row justify-center q-my-md" align="center">
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
    </Transition>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import ProposalsData from "../../data/proposals.json"

export default defineComponent({
  name: 'QuestionPage',
  components: {
  },
  data() {
    return {
      proposals: ProposalsData.proposals,
      isShowTalkCard: false,
      isShowButtons: false,
    }
  },
  mounted : function(){
    // トークカードの表示
    setTimeout(() => {this.isShowTalkCard = true}, 1200)
    // その他ボタンの表示
    setTimeout(() => {this.isShowButtons = true}, 2500)
  },
  computed: {
    suggesttedTalk() {
      const suggestedTalkUuid = this.$route.params.uuid
      return this.proposals.find((proposal) => proposal.uuid === suggestedTalkUuid)
    },
    tweetHrefUrl() {
      const shareUrl = "https://2024.kphpug.jp/?uuid=" + this.suggesttedTalk.uuid
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
