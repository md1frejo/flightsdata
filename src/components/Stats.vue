<script setup>

 import {clayout} from '../config/layout.js'
   
 const { airline, sourcecity, destcity, stops } =  defineProps({
   airline: Object,
   sourcecity: Object,
   destcity: Object,
   stops: Object,
 })

 const asum = Object.values(airline).reduce((acc,val) => acc+val,0)
 const ssum = Object.values(sourcecity).reduce((acc,val) => acc+val,0)
 const dsum = Object.values(destcity).reduce((acc,val) => acc+val,0)
 const tsum = Object.values(stops).reduce((acc,val) => acc+val,0)
  
</script>

<template>
  <div class="flex space-x-6 p-4">

    <div class="flex-1">
      <h2 class="text-lg font-semibold mb-2">airline</h2>
      <table class="min-w-full border text-sm">
        <thead class="bg-limegrad-300">
          <tr>
            <th class="px-3 py-2 text-left">Airline</th>
            <th class="px-3 py-2 text-left">Value</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(val, airl, i) in airline" :key="i"
            class="odd:bg-white even:bg-gray-50">
            <td class="px-3 py-1">{{ airl }}</td>
            <td class="px-3 py-1">{{ val }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    
     <div class="flex-1">
      <h2 class="text-lg font-semibold mb-2">Source Cities</h2>
      <table class="min-w-full border text-sm">
        <thead class="bg-navajoWhite4g-300">
            <tr>
              <th class="px-3 py-2 text-left">City</th>
              <th class="px-3 py-2 text-left">Value</th>
            </tr>
        </thead>
          <tbody>
            <tr v-for="(val, city, i) in sourcecity" :key="i"
		class="odd:bg-white even:bg-gray-50">
              <td class="px-3 py-1">{{ city }}</td>
              <td class="px-3 py-1">{{ val }}</td>
            </tr>
          </tbody>
	</table>
      </div>

      <div class="flex-1">
	<h2 class="text-lg font-semibold mb-2">Destination Cities</h2>
	<table class="min-w-full border text-sm">
          <thead class="bg-SteelBlueg-300">
            <tr>
              <th class="px-3 py-2 text-left">City</th>
              <th class="px-3 py-2 text-left">Value</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(val, city, i) in destcity" :key="i"
              class="odd:bg-white even:bg-gray-50">
              <td class="px-3 py-1">{{ city }}</td>
              <td class="px-3 py-1">{{ val }}</td>
            </tr>
          </tbody>
	</table>
      </div>

      <div class="flex-1">
	<h2 class="text-lg font-semibold mb-2">stops</h2>
	<table class="min-w-full border text-sm">
          <thead class="bg-limegrad-300">
            <tr>
              <th class="px-3 py-2 text-left">stops</th>
              <th class="px-3 py-2 text-left">Value</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(val, stops, i) in stops" :key="i"
              class="odd:bg-white even:bg-gray-50">
              <td class="px-3 py-1">{{ stops }}</td>
              <td class="px-3 py-1">{{ val }}</td>
            </tr>
          </tbody>
	</table>
      </div>
      
    </div>

</template>

<style scoped>

</style>
