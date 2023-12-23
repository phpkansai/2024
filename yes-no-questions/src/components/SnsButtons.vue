<template>
  <q-page-sticky position="bottom-left" :offset="[18, 18]">
    <q-fab
        v-model="shareButton"
        external-label
        :hide-label="hideLabel"
        :label="buttonLabelMessage"
        vertical-actions-align="left"
        color="deep-orange-10"
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
      <q-fab-action color="white" text-color="black" class="child-button" @click="shareByFacebook">
        <img src="~/assets/sns/facebook.png" alt="Line" class="sns-icon"/>
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
      shareUrl: "https://2024.kphpug.jp/yntest",
      twitterHashtags: "phpkansai,トーク診断",
      hideLabel: true,
      buttonLabelMessage: "",
    }
  },
  computed: {},
  methods: {
    shareByLine() {
      if(this.isDev()) return
      const url = "https://line.me/R/msg/text/?"
          + encodeURIComponent(this.shareUrl)
      window.open(url, "_blank")
    },
    shareByTwitter() {
      if(this.isDev()) return
      const postMessage = "PHPカンファレンス関西2024 オススメトーク診断!!"
      const url = "https://twitter.com/share?url="
          + encodeURIComponent(this.shareUrl)
          + "&text=" + postMessage + "&hashtags=" + this.twitterHashtags
      window.open(url, "_blank")
    },
    shareByFacebook() {
      if(this.isDev()) return
      const url = "https://www.facebook.com/sharer.php?u="
          + encodeURIComponent(this.shareUrl)
      window.open(url, "_blank")
    },
    shareByHatebu() {
      if(this.isDev()) return
      const url = "http://b.hatena.ne.jp/add?mode=confirm&url="
      + encodeURIComponent(this.shareUrl)
      + "&title=PHPカンファレンス関西2024オススメトーク診断!!"
      window.open(url, "_blank")
    },
    shareByCopy() {
      if(this.isDev()) return
      navigator.clipboard.writeText(this.shareUrl)
      this.buttonLabelMessage = "URLをコピーしました"
      this.hideLabel = false
      setTimeout(() => {
        this.buttonLabelMessage = ""
        this.hideLabel = true
      }, 2000)
    },
    isDev() {
      // .env使えるようにしたい
      return false
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
