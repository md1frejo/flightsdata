<script setup>

 import { Activity } from "lucide-vue-next";
 import fdata from '../../src/flightsdata.json'
 import { ref } from 'vue'

 const fdatas = JSON.parse(fdata).slice(0, 100)

 /* console.log(Object.entries(fdata)) */
 
 /* const keys = Object.keys(fdata[0])
  * const data = Object.entries(JSON.parse(fdata))
  */
 
</script>

<template>
  <div>
    <Activity class="w-10 h-10 text-blue-200" />
    <p class="text-8xl">Main</p>
  </div>
   <div>
    <h2>iteration:</h2>
    <ul>
      <li v-for="(r,i) in fdatas" :key="i">
	{{ r.airline }} and {{ r.source_city }} 
      </li>
    </ul>
  </div>
</template>

<style scoped>

</style>
