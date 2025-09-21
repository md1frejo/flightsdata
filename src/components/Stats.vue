<script setup>

 import {
   Chart as ChartJS,
   Title, Tooltip, Legend,
   BarElement, CategoryScale, LinearScale,
 } from 'chart.js'
 
 
 import { ref, onMounted, onBeforeUnmount, watch } from 'vue'
 import {clayout} from '../config/layout.js'
 
 const { airline, sourcecity, destcity, stops, duration } =  defineProps({
   airline: Object,
   sourcecity: Object,
   destcity: Object,
   stops: Object,
   duration: Object,
   ts: Number,
   s1: Number,
   s2: Number,
   s3: Number,
   s4: Number,
 })

 const asum = Object.values(airline).reduce((acc,val) => acc+val,0)
 const ssum = Object.values(sourcecity).reduce((acc,val) => acc+val,0)
 const dsum = Object.values(destcity).reduce((acc,val) => acc+val,0)
 const tsum = Object.values(stops).reduce((acc,val) => acc+val,0)
 const csum = Object.values(duration).reduce((acc,val) => acc+val,0)
 
</script>

<template>
  <p class="text-4xl">debug: {{ts}}</p>
  <div class="flex space-x-6 p-4">

    <div class="flex-1">
      <h2 class="text-lg font-semibold mb-2">airline</h2>
      <table class="min-w-full border text-sm">
        <thead :class="[clayout.stats1,'bg-navajoWhite4g-800']">
          <tr>
            <th class="px-3 py-2 text-left">Airline</th>
            <th class="px-3 py-2 text-left">% of flights</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(val, airl, i) in airline" :key="i"
            class="odd:bg-white even:bg-gray-50">
            <td class="px-3 py-1">{{ airl }}</td>
            <td class="px-3 py-1">{{ (val/s1).toFixed(2) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    
     <div class="flex-1">
      <h2 class="text-lg font-semibold mb-2">Source Cities</h2>
      <table class="min-w-full border text-sm">
        <thead :class="[clayout.stats1,'bg-navajoWhite4g-800']">
            <tr>
              <th class="px-3 py-2 text-left">City</th>
              <th class="px-3 py-2 text-left">% of flights</th>
            </tr>
        </thead>
          <tbody>
            <tr v-for="(val, city, i) in sourcecity" :key="i"
		class="odd:bg-white even:bg-gray-50">
              <td class="px-3 py-1">{{ city }}</td>
	      <td class="px-3 py-1">{{ (val/s2).toFixed(2) }}</td>
            </tr>
          </tbody>
	</table>
      </div>

      <div class="flex-1">
	<h2 class="text-lg font-semibold mb-2">Destination Cities</h2>
	<table class="min-w-full border text-sm">
          <thead :class="[clayout.stats1,'bg-navajoWhite4g-800']">
            <tr>
              <th class="px-3 py-2 text-left">City</th>
              <th class="px-3 py-2 text-left">% of flights</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(val, city, i) in destcity" :key="i"
              class="odd:bg-white even:bg-gray-50">
              <td class="px-3 py-1">{{ city }}</td>
              <td class="px-3 py-1">{{ (val/s3).toFixed(2) }}</td>
            </tr>
          </tbody>
	</table>
      </div>

      <div class="flex-1">
	<h2 class="text-lg font-semibold mb-2">stops</h2>
	<table class="min-w-full border text-sm">
          <thead :class="[clayout.stats1,'bg-navajoWhite4g-800']">
            <tr>
              <th class="px-3 py-2 text-left">stops</th>
              <th class="px-3 py-2 text-left">% of flights</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(val, stops, i) in stops" :key="i"
              class="odd:bg-white even:bg-gray-50">
              <td class="px-3 py-1">{{ stops }}</td>
              <td class="px-3 py-1">{{ (val/s4).toFixed(2) }}</td>
            </tr>
          </tbody>
	</table>
      </div>
  </div>

  <div class="bg-blue-100 ">
    <p class="text-4xl">more info</p>
  </div>
  
</template>

<style scoped>

</style>
