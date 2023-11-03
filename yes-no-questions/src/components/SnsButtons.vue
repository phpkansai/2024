<template>
  <q-page-sticky position="bottom-left" :offset="[18, 18]">
    <q-fab
        v-model="shareButton"
        external-label
        :hide-label="hideLabel"
        :label="buttonLabelMessage"
        vertical-actions-align="left"
        color="purple"
        icon="share"
        direction="up"
    >
      <q-fab-action color="white" text-color="black" class="child-button" @click="shareByCopy" icon="content_copy">
      </q-fab-action>
      <q-fab-action color="white" text-color="black" class="child-button" @click="shareByHatebu">
        <img src="~/assets/sns/hatebu.png" alt="Line" class="sns-icon"/>
      </q-fab-action>
      <q-fab-action color="white" text-color="black" class="child-button" @click="shareByLine">
        <img src="~/assets/sns/line.png" alt="Line" class="sns-icon"/>
      </q-fab-action>
      <q-fab-action color="white" text-color="black" class="child-button" @click="shareByTwitter">
        <img src="~/assets/sns/x.png" alt="Line" class="sns-icon"/>
      </q-fab-action>
    </q-fab>
  </q-page-sticky>
</template>

<script>
import { defineComponent } from 'vue'
import LineIcon from "../assets/sns/line.png"

export default defineComponent({
  name: 'SnsButton',
  data() {
    return {
      shareButton: false,
      lineIcon: LineIcon,
      shareUrl: "https://2024.kphpug.jp/yes-no-test",
      twitterHashtags: "phpkansai,ぺちこん関西おすすめトーク診断",
      hideLabel: true,
      buttonLabelMessage: "",
    }
  },
  computed: {},
  methods: {
    shareByLine() {
      const url = "https://line.me/R/msg/text/?"
          + encodeURIComponent(this.shareUrl)
      window.open(url, "_blank")
    },
    shareByTwitter() {
      const postMessage = "PHPカンファレンス関西2024 おすすめトーク診断!!"
      const url = "https://twitter.com/share?url="
          + encodeURIComponent(this.shareUrl)
          + "&text=" + postMessage + "&hashtags=" + this.twitterHashtags
      window.open(url, "_blank")
    },
    shareByHatebu() {
      const url = "http://b.hatena.ne.jp/add?mode=confirm&url="
      + encodeURIComponent(this.shareUrl)
      + "&title=PHPカンファレンス関西2024おすすめトーク診断!!"
      window.open(url, "_blank")
    },
    shareByCopy() {
      navigator.clipboard.writeText(this.shareUrl)
      this.buttonLabelMessage = "URLをコピーしました"
      this.hideLabel = false
      setTimeout(() => {
        this.buttonLabelMessage = ""
        this.hideLabel = true
      }, 2000)
    }
  }
})
</script>
<style scoped>
.child-button {
  width: 48px;
  height: 48px;
}

.sns-icon {
  width: 24px;
  height: 24px;
  vertical-align: middle;
}
</style>
