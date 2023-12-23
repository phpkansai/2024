<template>
  <div>
    <div v-if="time <= 0" class="q-my-lg">
      <q-btn
          color="amber-8"
          class="glossy"
          text-color="white"
          rounded
          label="GAME START"
          @click="stopwatchStart"
      />
    </div>
    <div v-else class="q-my-lg text-h6">
      {{ timerText }}
    </div>

    <div class="row justify-around">
      <div
          v-for="proposal in cards"
          :key="proposal.cardId "
          class="col-4"
      >
        <div v-show="isOpen(proposal.cardId)">
          <div v-if="proposal.isJoker">
            <q-card class="q-mx-sm q-my-sm card" @click="openCard(proposal.cardId, proposal.isJoker)">
              <q-intersection transition="flip-right">
                <q-img
                    src="../../public/img/joker.png"
                />
              </q-intersection>
            </q-card>
          </div>
          <div v-else>
            <q-card class="q-mx-sm q-my-sm card ">
              <q-intersection transition="flip-right">
                <q-img
                    :src="'../../public/results/' + proposal.uuid + '.png'"
                />
              </q-intersection>
            </q-card>
          </div>
        </div>
        <div v-show="!isOpen(proposal.cardId)">
          <q-card class="q-mx-sm q-my-sm card" @click="openCard(proposal.cardId, proposal.isJoker)">
            <q-intersection transition="flip-right">
              <q-img
                  src="../../public/img/gameCard.png"
              />
            </q-intersection>
          </q-card>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import ProposalsData from "../../data/proposals.json"
export default {
  name: "CardGame",
  data() {
    return {
      cards: [],
      openedCardIds: [],
      selectedCardIds: [],
      openLock: true,
      isClear: false,
      time: null,
    }
  },
  mounted() {
    this.cards = this.getTargetsProposals()
  },
  computed: {
    timerText() {
      const m = Math.floor(this.time / 6000).toString().padStart( 2, '0')
      const s = Math.floor((this.time % 6000) / 100).toString().padStart( 2, '0')
      const ms = (this.time % 100).toString().padStart( 2, '0')
      return `${m}:${s}:${ms}`
    },
  },
  methods: {
    getTargetsProposals() {
      // this.proposals の要素をランダムに4つ重複無しで取り出す
      const targets = []
      let cardId = 0
      const proposalsCount = ProposalsData.proposals.length
      while (targets.length < 8) {
        const index = Math.floor(Math.random() * proposalsCount)
        const proposal = ProposalsData.proposals[index]
        if (targets.find((target) => target.uuid === proposal.uuid) === undefined) {
          // 神経衰弱のため2つ入れる
          targets.push({
            uuid: proposal.uuid,
            isJoker: false,
            cardId: cardId,
          })
          targets.push({
            uuid: proposal.uuid,
            isJoker: false,
            cardId: cardId + 1,
          })
          cardId += 2
        }
      }
      // joker追加
      targets.push({
        uuid: "joker",
        isJoker: true,
        cardId: cardId,
      })
      // シャッフル
      for (let i = targets.length - 1; i > 0; i--) {
        const r = Math.floor(Math.random() * (i + 1))
        const tmp = targets[i]
        targets[i] = targets[r]
        targets[r] = tmp
      }
      return targets
    },
    isOpen(cardId) {
      if (this.isClear) {
        return true
      }
      return this.openedCardIds.includes(cardId) || this.selectedCardIds.includes(cardId)
    },
    /**
     * カードを開く
     * @param cardId
     * @param isJoker
     */
    openCard(cardId, isJoker) {
      if (this.isClear || this.openLock) {
        return
      }

      if (this.openedCardIds.length >= 2) {
        return
      }
      if (this.openedCardIds.includes(cardId)) {
        return
      }
      this.openedCardIds.push(cardId)

      if (isJoker) {
        this.openLock = true
        setTimeout(() => {
          this.openedCardIds = []
          this.openLock = false
        }, 1000)
        return
      }

      if (this.openedCardIds.length >= 2) {
        this.checkMatch()
      }
    },
    checkMatch() {
      this.openLock = true
      const cardId1 = this.openedCardIds[0]
      const cardId2 = this.openedCardIds[1]
      const proposal1 = this.cards.find((proposal) => proposal.cardId === cardId1)
      const proposal2 = this.cards.find((proposal) => proposal.cardId === cardId2)
      if (proposal1.uuid === proposal2.uuid) {
        this.selectedCardIds.push(cardId1)
        this.selectedCardIds.push(cardId2)
      }
      // クリア判定
      if (this.selectedCardIds.length === this.cards.length - 1) {
        this.isClear = true
        this.stopwatchStop()
      }
      setTimeout(() => {
        this.openedCardIds = []
        this.openLock = false
      }, 1000)
    },
    stopwatchStart() {
      this.time = 0
      this.openLock = false
      this.timer = setInterval(() => {
        this.time++
      }, 10)
    },
    stopwatchStop() {
      clearInterval(this.timer)
    },
  },
}
</script>

<style scoped>
.card {
  /*height: 6.5vh;*/
}
</style>
