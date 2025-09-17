<script setup>

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
  <div>
    <p class="text-air1 text-green4g">stats data</p>
    <p class="text-air1"> debug: {{asum }} </p>
    <li v-for="(c,d,i) in sourcecity" :key="i">
      c: {{c}} d: {{d}} i: {{i}}
    </li>
  </div>
</template>

<style scoped>

</style>
