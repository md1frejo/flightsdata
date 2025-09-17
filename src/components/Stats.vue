<script setup>

 const props = defineProps({
   airline: Object,
 })

 
</script>

<template>
  <div>
    <p class="text-air1 text-green4g">stats data</p>
    <p class="text-air1"> airline: {{ airline }} </p>
  </div>
</template>

<style scoped>

</style>
