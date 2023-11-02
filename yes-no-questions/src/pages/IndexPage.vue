<template>
  <q-page>
    <div>
      <div class="flex flex-center">
        <div class="row justify-center">
          <div class="col-11 q-my-md" align="center">
            <img
              alt="Quasar logo"
              src="~assets/logo.svg"
              style="width: 200px; height: 200px"
            >
          </div>
          
          <div class="col-11 q-my-md" align="center">
            説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ説明が入るところ
          </div>

          <div class="col-11 q-my-md" align="center">
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
        
      </div>
    </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'IndexPage'
})
</script>
