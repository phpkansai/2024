<template>
  <q-page class="fullscreen">
    <div class="row justify-center">
      <div class="col-xs-11 absolute-center text-center q-my-md">

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
              <div class="col-xs-11 col-md-11 text-center q-my-md q-mx-lg">
                説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-11 q-my-md q-mx-md">
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
