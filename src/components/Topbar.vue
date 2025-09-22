<script setup>
 
 import { Plane} from "lucide-vue-next";
 import {clayout} from '../config/layout.js'
 
</script>

<template>
  <div>
    <div :class="['bg-gradient-to-b',clayout.topgf,clayout.topgt,'p-6 rounded-2xl flex items-center space-x-4 justify-center']">
      <Plane class="w-20 h-20 text-greyg-100" />
      <p class="text-8xl text-SteelBlueg-400 text-center">flightsdata</p>
      <p class="text-4xl text-brown4-200 text-center">indian cities</p>
    </div>
  </div>
</template>

<style scoped>

</style>
