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

    <div v-if="suggestedTalk !== null" class="row justify-center q-my-lg">
      <div class="col-xs-11 col-md-7">
        <Transition appear name="slide-card-effect" mode="out-in">
          <q-card v-show="isShowTalkCard">
            <q-img :src="resultThumbnailBackground" >
              <div class="absolute-full text-center flex flex-center result-card-background">
                <div>
                  <div class="text-h6 q-px-md q-pt-sm text-weight-bolder text-grey-9 text-overflow-lines">
                    {{ suggestedTalk.title }}
                  </div>
                  <div v-if="suggestedTalk.speaker.name" class="text-subtitle1 q-pa-sm text-grey-8">
                    {{ suggestedTalk.speaker.name }}
                    <template v-if="suggestedTalk.speaker.twitter">
                      (@{{ suggestedTalk.speaker.twitter }})
                    </template>
                    さん
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
                :href="tweetHrefUrl"
                target="_blank"
            >
              <template v-slot:label>
                <div class="row items-center no-wrap">
                  <p left class="x-icon">𝕏</p>
                  <div class="text-center">結果を共有する</div>
                </div>
              </template>

              <q-list>
                <q-item clickable v-close-popup @click="resultShareByTwitter">
                  <q-item-section avatar>
                    <q-avatar>
                      <img src="~/assets/sns/x.png" alt="X"/>
                    </q-avatar>
                  </q-item-section>
                  <q-item-section>
                    <q-item-label>X</q-item-label>
                  </q-item-section>
                </q-item>

                <q-item clickable v-close-popup @click="resultShareByFacebook">
                  <q-item-section avatar>
                    <q-avatar>
                      <img src="~/assets/sns/facebook.png" alt="Facebook"/>
                    </q-avatar>
                  </q-item-section>
                  <q-item-section>
                    <q-item-label>Facebook</q-item-label>
                  </q-item-section>
                </q-item>

                <q-item clickable v-close-popup @click="resultShareByLine">
                  <q-item-section avatar>
                    <q-avatar>
                      <img src="~/assets/sns/line.png" alt="LINE"/>
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
                    <q-item-label>共有メッセージコピー</q-item-label>
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
                class="q-py-md"
                flat
                size="14px"
                label="もう一度診断する"
                :to="{name: 'IndexPage'}"
            />
          </div>
        </div>

        <div class="row justify-center">
          <div class="col-xs-11 col-md-7">
            <PhpConKansaiCard />
          </div>
        </div>
      </div>
    </Transition>

    <q-dialog v-model="dialog">
      <q-card class="bg-orange-2 dialog-card text-grey-9">
        <q-card-section class="">
          <div class="text-h6 text-center text-orange-10 text-weight-bold">
            PHPカンファレンス関西2024は<br />
            2024年2月11日（日）開催!!
          </div>
        </q-card-section>

        <q-card-section class="q-py-none">
          <div class="row justify-center">
            <div class="col-6 text-center">
              <q-img
                  class="col-5 php-con-logo"
                  src="../assets/php_con_logo2024.png"
                  fit="contain"
              />
            </div>
            <div class="col-6">
              <q-list dense>
                <q-item
                    clickable
                    href="https://2024.kphpug.jp/"
                    target="_blank"
                    class="q-px-xs"
                >
                  <q-item-section>
                    <q-item-label>
                      <q-icon color="red-11" name="home" size="large"/>
                      公式サイト
                    </q-item-label>
                  </q-item-section>
                </q-item>

                <q-item
                    clickable
                    href="https://fortee.jp/phpcon-kansai2024/timetable"
                    target="_blank"
                    class="q-px-xs"
                >
                  <q-item-section>
                    <q-item-label>
                      <q-icon color="red-11" name="date_range" size="large"/>
                      タイムテーブル
                    </q-item-label>
                  </q-item-section>
                </q-item>

                <q-item
                    clickable
                    href="https://peatix.com/event/3752841/view?k=480d6bc1430a629adca5b030b2457224a3e4a4c6"
                    target="ticket"
                    class="q-px-sm"
                >
                  <q-item-section>
                    <q-item-label>
                      <q-icon color="red-11" name="confirmation_number" size="large"/>
                      チケット購入
                    </q-item-label>
                  </q-item-section>
                </q-item>
              </q-list>
            </div>
          </div>
        </q-card-section>


        <q-card-section class="text-center q-pb-none">
          チケットはもう買った？？
        </q-card-section>
        <q-card-actions align="center">
          <q-btn label="買った" size="md" color="amber-2 text-black" class="q-mx-md" @click="pushBoughtButton" />
          <q-btn label="まだです" size="md" color="orange-7" class="q-mx-md" @click="pushNotBoughtYetButton" />
        </q-card-actions>
        <q-card-section class="text-center q-pt-sm text-caption text-red-10">
          チケットは1/17までにお買い求めください。
        </q-card-section>
      </q-card>
    </q-dialog>

    <SnsButtons />

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import ProposalsData from "../../data/proposals.json"
import ResultThumbnail from "../assets/resultThumbnail.png"
import PhpConKansaiCard from "../components/PhpConKansaiCard.vue"
import SnsButtons from "../components/SnsButtons.vue"
import {Notify} from 'quasar'

export default defineComponent({
  name: 'QuestionPage',
  components: {
    PhpConKansaiCard,
    SnsButtons,
  },
  data() {
    return {
      proposals: ProposalsData.proposals,
      isShowTalkCard: false,
      isShowButtons: false,
      resultThumbnailBackground: ResultThumbnail,
      buttonLabelMessage: "",
      dialog: false,
      hideLabel: true,
    }
  },
  mounted : function(){
    if (this.suggestedTalk === null) {
      this.$router.push({name: 'ErrorNotFound'})
    }
    // トークカードの表示
    setTimeout(() => {this.isShowTalkCard = true}, 1200)
    // その他ボタンの表示
    setTimeout(() => {this.isShowButtons = true}, 2500)
    // ダイアログ表示制御
    setTimeout(() => {if(this.isShowDialog())this.dialog = true}, 5000)
  },
  computed: {
    suggestedTalk() {
      const suggestedTalkUuid = this.$route.params.uuid
      const talk = this.proposals.find((proposal) => proposal.uuid === suggestedTalkUuid)
      if(talk === undefined) {
        return null
      }
      return talk
    },
    tweetHrefUrl() {
      const shareUrl = this.shareUrl()
      const postMessage = "私におすすめのトークはこれでした!! "
      const hashtags = "phpkansai,トーク診断"
      return "https://twitter.com/share?url=" + shareUrl + "&text=" + postMessage + "&hashtags=" + hashtags
    }
  },
  methods: {
    /**
     * ダイアログを表示するかどうかを判定する
     */
    isShowDialog() {
      const randNumber = Math.floor(Math.random() * 5)
      if (randNumber < 4) {
        // 5回に1回表示
        return false
      }
      const pushBoughtDate = localStorage.getItem("pushBoughtDate")
      if(!pushBoughtDate) {
        // ローカルストレージにデータがない場合は表示
        return true
      }
      // 昨日以前に表示した場合は表示
      const yesterday = (new Date()).setDate((new Date()).getDate() - 1)
      return (new Date(pushBoughtDate) < new Date(yesterday))
    },
    /**
     * ダイアログ「購入した」のボタンを押したときの処理
     * ローカルストレージにボタン押下日を保存
     */
    pushBoughtButton() {
      localStorage.setItem('pushBoughtDate', new Date().toDateString())
      this.dialog = false
    },
    /**
     * ダイアログ「まだです」のボタンを押したときの処理
     * ローカルストレージのデータ削除
     */
    pushNotBoughtYetButton() {
      localStorage.removeItem('pushBoughtDate')
      const url = "https://peatix.com/event/3752841/view?k=480d6bc1430a629adca5b030b2457224a3e4a4c6"
      window.open(url, "ticket")
      this.dialog = false // 一応、ダイアログを閉じる
    },
    /**
     * 共有用URLを返す
     * @returns {string}
     */
    shareUrl() {
      return "https://2024.kphpug.jp/yntest/results/" + this.suggestedTalk.uuid + ".html"
    },
    resultShareByTwitter() {
      window.open(this.tweetHrefUrl, "_blank")
    },
    resultShareByFacebook() {
      const url = "https://www.facebook.com/sharer.php?u="
          + encodeURIComponent(this.shareUrl())
      window.open(url, "_blank")
    },
    resultShareByLine() {
      let speakerName = ""
      if (this.suggestedTalk.speaker.name !== "") {
        speakerName = "by " + this.suggestedTalk.speaker.name + "さん\n"
      } else {
        speakerName = ""
      }
      const message = "PHPカンファレンス関西2024\n【おすすめトーク診断】\n\n私におすすめのトークはこれでした!! \n\n"
          + this.suggestedTalk.title + "\n" + speakerName
      const url = "https://line.me/R/msg/text/?"
          + encodeURIComponent(message + this.shareUrl())
      window.open(url, "_blank")
    },
    resultShareByCopy() {
      let speakerName = ""
      if (this.suggestedTalk.speaker.name !== "") {
        speakerName = "by " + this.suggestedTalk.speaker.name + "さん\n"
      } else {
        speakerName = ""
      }
      const message = "PHPカンファレンス関西2024\n【おすすめトーク診断】\n\n私におすすめのトークはこれでした!! \n\n"
          + "**" + this.suggestedTalk.title + "**\n" + speakerName
      navigator.clipboard.writeText(message + this.shareUrl())
      Notify.create('コピーしました!!')
    },
  }
})
</script>
<style scoped>
.page {
  padding-bottom: 80px;
}

.result-card-background {
  background:rgba(255,255,255,0.3);
}

.text-overflow-lines {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
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
  right: 4px;
  width: 22.5%;
  opacity: 1.0;
  z-index: -1;
}

.dialog-card {
  min-width: 380px;
}

.php-con-logo {
  max-width: 100px;
}

.x-icon {
  font-size: 1.715em;
  margin: 0px 12px 0 0;
}
</style>
