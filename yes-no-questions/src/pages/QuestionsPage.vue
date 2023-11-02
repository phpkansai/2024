<template>
  <q-page class="flex-center">
    <div class="row justify-center">
      <div class="col-11 q-mt-md" align="center">
        <p class="q-my-sm">PHPカンファレンス関し2024<br>おすすめトーク診断</p>
      </div>
      <div class="col-11 text-h5" align="center">
        {{ questionCount }}問目
      </div>

      <div class="col-11" v-if="nowQuestion">
        <Transition name="slide-effect" mode="out-in">
          <!-- 意味がないように見えるが、v-ifで表示切り替えをすることでアニメーションを実現している -->
          <QuestionCard
            v-if="slideFlag"
            :question="nowQuestion.question"
          />
          <QuestionCard
            v-else
            :question="nowQuestion.question"
          />
        </Transition>

        <div class="row justify-center">
          <q-btn
            @click="nextQuestion(nowQuestion.yes, nowQuestion.resultTalkUuidWhenYes)"
            color="green"
            class="full-width q-my-md"
            :disable="isButtonDisable"
            label="Yes"
            padding="md"
            size="16px"
          />
          <q-btn
            @click="nextQuestion(nowQuestion.no, nowQuestion.resultTalkUuidWhenNo)"
            color="deep-orange"
            class="full-width q-my-md"
            :disable="isButtonDisable"
            label="No"
            padding="md"
            size="16px"
          />
        </div>
      </div>
    </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'
import QuestionCard from "../components/QuestionsCard.vue"
import QuestionsData from "../../data/questions.json"

export default defineComponent({
  name: 'QuestionPage',
  components: {
    QuestionCard,
  },
  data() {
    return {
      nowQuestionId: 1,
      questionCount: 1,
      slideFlag: true,
      isButtonDisable: false,
      questions: QuestionsData,
    }
  },
  computed: {
    nowQuestion() {
      return this.questions.find((question) => question.id === this.nowQuestionId)
    }
  },
  methods: {
    nextQuestion(nextQuestionId, resultTalkUuid) {
      this.isButtonDisable = true
      setTimeout(() => {this.isButtonDisable = false}, 500)
      if (resultTalkUuid) {
        this.$router.push({
          name: 'ResultPage',
          params: {
            uuid: resultTalkUuid
          }
        })
        return
      }
      this.slideFlag = !this.slideFlag
      this.nowQuestionId = nextQuestionId
      this.questionCount ++
    }
  }
})
</script>
<style scoped>
.slide-effect-enter-active,
.slide-effect-leave-active {
  transition: all 0.25s ease-out;
}

.slide-effect-enter-from {
  opacity: 0;
  transform: translateX(30px);
}

.slide-effect-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}
</style>
