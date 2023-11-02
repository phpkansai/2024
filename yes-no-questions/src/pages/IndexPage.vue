<template>
  <q-page class="flex-center">
    <div class="column items-center">
      <div class="col-11 q-my-md">
        <img
          alt="Quasar logo"
          src="~assets/logo.svg"
          style="width: 200px; height: 200px"
        >
      </div>
    </div>

    <div class="column items-center">
      <div class="col-11 q-my-md q-mx-md">
        説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ
      </div>
    </div>

    <div class="row items-center">
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

    <BackWebSiteButton />
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import BackWebSiteButton from "../components/BackWebSiteButton.vue"

export default defineComponent({
  name: 'IndexPage',
  components: {
    BackWebSiteButton,
  },
})
</script>
