<template>
  <q-page-sticky position="bottom-left" :offset="[18, 18]">
    <q-btn
        fab
        padding="sm md"
        label="Webサイト"
        icon="keyboard_arrow_left"
        color="blue-grey-10"
        href="/"
    />
  </q-page-sticky>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'BackWebSiteButton',
  data() {
    return {}
  },
  computed: {},
  methods: {}
})
</script>
<style scoped>
</style>
