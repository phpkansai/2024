<template>
  <q-card class="q-py-md php-con-card">
    <q-item>
      <q-item-section>
        <q-item-label class="text-center text-h6 text-weight-bold text-orange-10">
          PHPカンファレンス関西2024は<br/>2024年2月11日（日）開催!!
        </q-item-label>
      </q-item-section>
    </q-item>
    <q-card-section horizontal class="justify-center">
      <q-img
          class="col-5 php-con-logo"
          src="../assets/php_con_logo2024.png"
          fit="contain"
      />
      <q-card-section class="q-py-xs q-pr-xs">
        <q-list>
          <q-item
              clickable
              href="https://2024.kphpug.jp/"
              target="_blank"
              class="q-px-xs"
          >
            <q-item-section avatar>
              <q-icon color="red-11" name="home" />
            </q-item-section>
            <q-item-section>
              <q-item-label>公式サイト</q-item-label>
            </q-item-section>
          </q-item>

          <q-item
              clickable
              href="https://fortee.jp/phpcon-kansai2024/timetable"
              target="_blank"
              class="q-px-xs"
          >
            <q-item-section avatar>
              <q-icon color="red-11" name="date_range" />
            </q-item-section>
            <q-item-section>
              <q-item-label>タイムテーブル</q-item-label>
            </q-item-section>
          </q-item>

          <q-item
              clickable
              href="https://peatix.com/event/3752841/view?k=480d6bc1430a629adca5b030b2457224a3e4a4c6"
              target="_blank"
              class="q-px-xs"
          >
            <q-item-section avatar>
              <q-icon color="red-11" name="confirmation_number" />
            </q-item-section>
            <q-item-section>
              <q-item-label>チケット購入</q-item-label>
            </q-item-section>
          </q-item>
        </q-list>
      </q-card-section>
    </q-card-section>
  </q-card>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'PhpConKansaiCard',
  components: {
  },
  data() {
    return {
    }
  },
  mounted : function(){
  },
  computed: {
  },
  methods: {
  }
})
</script>
<style scoped>
.php-con-card {
  background-color: #fbe9e8;
}

.php-con-logo {
  max-width: 180px;
}
</style>
