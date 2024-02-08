<template>
    <div class="container mx-auto px-4 py-8" style="margin-left: 60px; margin-right: 60px;">
        <h1 class="flex items-center justify-center text-2xl mr-28 mb-8">My Infinite Gallery</h1>
      <div class="grid grid-cols-3 gap-8">
        <div v-for="image in images" :key="image.id" class="bg-gray-300 rounded-lg overflow-hidden w-64 h-64">
          <img :src="image.urls?.regular" :alt="image.alt_description" class="w-full h-full object-cover">
        </div>
      </div>
      <div v-if="loading" class="text-center mt-4">Loading...</div>
      <div v-else-if="error" class="text-center mt-4 text-red-500">{{ error }}</div>
    </div>
  </template>
  
  
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'gallery',
    data() {
      return {
        images: [],
        page: 1,
        loading: false,
        error: null
      };
    },
    mounted() {
      this.fetchImages();
      window.addEventListener('scroll', this.handleScroll);
    },
    beforeDestroy() {
      window.removeEventListener('scroll', this.handleScroll);
    },
    methods: {
      async fetchImages() {
        try {
          this.loading = true;
          const response = await axios.get(`https://api.unsplash.com/photos?page=${this.page}&per_page=10&client_id=yol3wuVgXf5Neb3hdNi2_PpDW9OC-wGOjeyKUcbbFt0`);
          this.images = [...this.images, ...response.data];
          this.page++;
          this.loading = false;
        } catch (error) {
          this.loading = false;
          this.error = error.message;
        }
      },
      handleScroll() {
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
          this.fetchImages();
        }
      }
    }
  };
  </script>
  
  <style>
  /* Add Tailwind CSS styles here */
  </style>
  