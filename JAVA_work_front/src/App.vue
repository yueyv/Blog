<template>
  <router-view></router-view>
</template>

<script>
  import * as echarts from 'echarts'
  import {
    provide,
  } from 'vue'
  export default {
    name: 'App',
    setup() {
      // 数据表
      provide('ec', echarts) // provide
    },
    components: {}
  }
</script>

<style>

</style>