<template>
  <q-card class="q-my-md memory-chan-stage">
    <q-card-section
      class="question-card-section bg-brown-1 text-blue-grey-10 flex flex-center text-center"
    >
      <div class="text-h6">{{ question }}</div>
    </q-card-section>
    <img
        :src="memoryChanRandom"
        class="memory-chan"
    />
  </q-card>
</template>

<script>
import { defineComponent } from 'vue'
import memoryChan1 from '../assets/memory-chan/memory-chan03-01.png'
import memoryChan2 from '../assets/memory-chan/memory-chan03-02.png'
import memoryChan3 from '../assets/memory-chan/memory-chan03-03.png'
import memoryChan4 from '../assets/memory-chan/memory-chan03-04.png'
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
    return {
      memoryChan1: memoryChan1,
      memoryChan2: memoryChan2,
      memoryChan3: memoryChan3,
      memoryChan4: memoryChan4,
    }
  },
  computed: {
    memoryChanRandom() {
      const memoryChanCount = 4
      const random = Math.floor(Math.random() * memoryChanCount) + 1
      return this[`memoryChan${random}`]
    }
  },
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

.memory-chan {
  position: absolute;
  bottom: 5px;
  right: 15px;
  width: 80px;
  opacity: 0.8;
  z-index: 1;
}
</style>
