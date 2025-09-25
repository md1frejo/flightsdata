<script setup>

 import {clayout} from '../config/layout.js'
 
 import Header from './Header.vue'
 import Stats from './Stats.vue'
 
 import { Activity,ShieldQuestionMark } from "lucide-vue-next"
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
 const fdatao = Object.entries(fdatas)
 
 const maxp = fdatao.reduce((max,[_,f])=>f.price > max.price ? f : max, {price: -Infinity})
 const maxp2 = Object.fromEntries(Object.entries(maxp).filter(([k]) => k !== "days_left"))
 
 const maxd = fdatao.reduce((max,[_,f])=>f.duration > max.duration ? f : max, {duration: -Infinity})
 const maxd2 = Object.fromEntries(Object.entries(maxd).filter(([k]) => k !== "days_left"))
 
 console.log(fdatao)
 
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
  <div class="bg-lightblueg-1200 rounded max-w-[60%] mx-auto">
    
    <div class="flex justify-center items-start space-x-2 mt-4">
      <ShieldQuestionMark class="w-10 h-10 text-brown4-500" />
      <p class="text-ma4 font-roboto text-brown4-400">highest price and duration</p>
    </div>
    <div class="flex justify-center items-start space-x-2 mt-4">
      <ul class="flex-space-x-4">
        <li v-for="(v,k) in maxp2" :key="`p-${k}`">
          <p :class="[clayout.main1,'text-ma3 font-roboto']"> {{ k.replace('_',' ') }}: {{ v }}</p>
        </li>
      </ul>
      <ul class="flex-space-x-4">
        <li v-for="(v,k) in maxd2" :key="`d-${k}`">
	  <p :class="[clayout.main1,'text-ma3 font-roboto']"> {{ k.replace('_',' ') }}: {{ v }}</p>
        </li>
      </ul>
    </div>
  </div>
  
</template>

<style scoped>

</style>
