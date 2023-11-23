<template>
  <q-card class="q-my-md memory-chan-stage">
    <q-card-section
      class="question-card-section bg-brown-1 text-blue-grey-10 flex flex-center text-center"
    >
      <div class="text-h6">{{ question }}</div>
    </q-card-section>
    <img
        src="~/assets/memory-chan/memory-chan03.png"
        class="memory-chan01"
    />
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
  min-height: 250px;
}

.memory-chan-stage {
  position:relative;
  z-index: 20;
}

.memory-chan01 {
  position: absolute;
  bottom: 0;
  right: 0;
  width: 100px;
  height: 100px;
  opacity: 0.3;
  z-index: 1;
}
</style>
