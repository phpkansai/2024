<template>
  <q-layout view="lHh Lpr lFf">
    <q-page-container>
      <vue-particles
          id="tsparticles"
          :particlesInit="particlesInit"
          :particlesLoaded="particlesLoaded"
          :options="particlesOptions"
      />
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref } from 'vue'
import { loadSlim } from "tsparticles-slim"
import particlesOptions from "../../data/particles.json"

export default defineComponent({
  name: 'MainLayout',
  data() {
    return {
      particlesOptions: particlesOptions,
    }
  },
  mounted() {
    alert("このページは実行委員向けのテストページです。\n他者に教えないようにしてください。")
  },
  computed: {
    particlesInit() {
      return async engine => {
        //await loadFull(engine);
        await loadSlim(engine);
      }
    },
    particlesLoaded() {
      return async container => {
        console.log("Particles container loaded", container);
      }
    },
  },
})
</script>
