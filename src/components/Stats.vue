<script setup>
 
 import {clayout} from '../config/layout.js'
 import { ref, onMounted } from 'vue'

 import {
   Chart as ChartJS,
   Title, Tooltip, Legend,
   PointElement,
   LinearScale, CategoryScale, // <-- both scales
   ScatterController
 } from "chart.js"
 
 const props = defineProps({
   airline: Object,
   sourcecity: Object,
   destcity: Object,
   stops: Object,
   duration: Object,
   fdatas: Array,  // expect [{airline, price, duration}, ...]
   ts: Number,
   s1: Number,
   s2: Number,
   s3: Number,
   s4: Number,
 })

 const canvasRef = ref(null)

 onMounted(() => {

   ChartJS.register(
     Title, Tooltip, Legend,
     PointElement,
     ScatterController,
     LinearScale, CategoryScale
   )
   
   new ChartJS(canvasRef.value.getContext('2d'), {
     type: 'scatter',
     data: {
       datasets: [{
         label: 'Airline vs Price',
         data: props.fdatas.map(v => ({
           x: v.duration,
           y: v.price,
           airline: v.airline
         })),
         backgroundColor: 'rgba(54,162,235,0.8)',
         pointRadius: 6,
         showLine: false,   // keep it as dots, not connected
	 tension: 0.3
       }]
     },
     options: {
       plugins: {
         tooltip: {
           callbacks: {
             label: ctx =>
               `${ctx.raw.airline}: ₹${ctx.raw.y} (duration ${ctx.raw.x}h)`
           }
         }
       },
       scales: {
         x: { type: 'linear', title: { display: true, text: "Duration (hours)" } },
         y: { title: { display: true, text: "Price (₹)" } }
       }
     }
   })
 })
 
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
    <p class="text-4xl">average price vs duration</p>
  </div>

  <!-- <p>graphs</p>
       <Bar :data="chartEx" :options="chartOptions" /> -->
   <div>
    <canvas ref="canvasRef" class="w-full h-96"></canvas>
  </div>
</template>

<style scoped>

</style>
