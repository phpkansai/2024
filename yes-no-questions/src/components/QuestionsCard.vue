<template>
  <q-card class="q-my-md">
    <q-card-section
      align="center"
      class="question-card-section bg-brown-1 text-blue-grey-10 flex flex-center"
    >
      <div class="text-h6">{{ question }}</div>
    </q-card-section>
  </q-card>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'QuestionCard',
  props: {
    question: {
      type: String,
      default: '',
      required: false
    },
  },
  data() {
    return {}
  },
  computed: {},
  methods: {}
})
</script>
<style scoped>
.question-card-section {
  min-height: 300px;
}
</style>
