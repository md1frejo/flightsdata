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

 import { ref } from 'vue'
 
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

 //console.log(Object.entries(fdatas))
 
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
    <ul>
      <li v-for="(r,i) in fdatas" :key="i">
	{{ r.airline }} and {{ r.source_city }} 
      </li>
    </ul>
  </div>
</template>

<style scoped>

</style>
