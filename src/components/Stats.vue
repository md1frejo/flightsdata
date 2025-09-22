<script setup>
 
 import { VectorSquare } from "lucide-vue-next" 
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
   s5: Number,
 })

 const canvasRef = ref(null)
 const canvasRef2 = ref(null) 
 
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
         label: 'duration vs price',
         data: props.fdatas.map(v => ({x: v.duration,y: v.price,airline: v.airline})),
         backgroundColor: '#528ab9',
         pointRadius: 5,
         showLine: false,   // keep it as dots, not connected
	 tension: 0.8
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

   new ChartJS(canvasRef2.value.getContext('2d'), {
     type: 'scatter',
     data: {
       datasets: [{
         label: 'stops vs duration',
         data: props.fdatas.map(v => ({x: v.stops, y: v.price, airline: v.airline})),
         backgroundColor: '#00bfff',
         pointRadius: 4,
         showLine: false,   // keep it as dots, not connected
	 tension: 0.8
       }]
     },
     options: {
       plugins: {
         tooltip: {
           callbacks: {
             label: ctx =>
               `${ctx.raw.airline}: ₹${ctx.raw.y} (stops ${ctx.raw.x}h)`
           }
         }
       },
       scales: {
         x: { type: 'category', title: { display: true, text: "Stops (hours)" } },
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

  <div class="max-w-[70%] mx-auto">>
    <canvas ref="canvasRef" class="w-full h-96"></canvas>
    <div class="flex items-center space-x-2 mt-4">
      <VectorSquare class="w-10 h-10 text-blue-200" />
      <p class="text-4x">flight time vs price</p>
    </div>
  </div>

  <div class="max-w-[70%] mx-auto">>
    <canvas ref="canvasRef2" class="w-full h-96"></canvas>
    <div class="flex items-center space-x-2 mt-4">
      <VectorSquare class="w-10 h-10 text-blue-200" />
      <p class="text-4x">flight stops vs price</p>
    </div>
  </div>

</template>

<style scoped>

</style>
