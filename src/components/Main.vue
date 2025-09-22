<script setup>


 import Header from './Header.vue'
 import Stats from './Stats.vue'
 
 import { Activity } from "lucide-vue-next"
 import fdata from "../../src/flightsdata.json"

 import airline from '../airline.json'
 import sourcecity from '../sourcecity.json'
 import destcity from '../destcity.json'
 import stops from '../sourcecity.json'
 import duration from '../duration.json'
 import tp from '../tp.json'

 import { ref,computed } from 'vue'
 
 const sa=Object.entries(airline)
 const ss=Object.entries(sourcecity)
 const sd=Object.entries(destcity)
 const st=Object.entries(stops)
 const su=Object.entries(duration) 
 const sp=Object.entries(tp)
 
 const s1=sa.flatMap(x => x[1]).reduce((acc, val) => acc + val, 0)
 const s2=ss.flatMap(x => x[1]).reduce((acc, val) => acc + val, 0)
 const s3=sd.flatMap(x => x[1]).reduce((acc, val) => acc + val, 0)
 const s4=st.flatMap(x => x[1]).reduce((acc, val) => acc + val, 0)
 const s5=su.flatMap(x => x[1]).reduce((acc, val) => acc + val, 0)
 const ts=sp.flatMap(x => x[1]).reduce((acc, val) => acc + val, 0)

 function rselect(arr,count) {
   const step = arr.length/count;   // spacing between picks
   return Array.from({ length: count }, (_, i) => {
     const idx = Math.floor(i * step);
     return arr[idx];
   });
 }
 
 const fdatas = rselect(JSON.parse(fdata),1000)
 const fdatas2 = rselect(JSON.parse(fdata),100)
 
 console.log(Object.entries(fdatas))

 // group flights into chunks of 10
 const chunkedFlights = computed(() => {
   const chunks = []
   for (let i = 0; i < fdatas2.length; i += 10) {
     chunks.push(fdatas2.slice(i, i + 10))
   }
   return chunks
 })
 
</script>

<template>

  <Header />
  
  <Stats :airline=airline :sourcecity=sourcecity :destcity=destcity
	 :stops=stops :duration=duration :fdatas=fdatas
	 :s1=s1 :s2=s2 :s3=s3 :s4=s4 :s5=s5 :ts=ts />
  
  <div>
    <Activity class="w-10 h-10 text-blue-200" />
    <p class="text-8xl">Main</p>
  </div>
   <div>
     <h2>iteration:</h2>

     <!-- loop through groups -->
     <div v-for="(group, gi) in chunkedFlights" :key="gi" class="flex flex-row gap-4 mb-4">
       <div v-for="(r, i) in group" :key="i" class="flex items-center space-x-2 p-2 border rounded">
	 {{ gi * 10 + i }} : {{ r.airline }} → {{ r.source_city }} → {{ r.destination_city }} loop
       </div>
     </div>
   </div>
   
</template>

<style scoped>

</style>
