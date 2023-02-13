<template>
  <div class="question">{{ question.title }}</div>
  <div class="grid-container">
    <button type="button" class="grid-button"
      v-for="(option, index) in question.options" :key="question.title"
      @click="$.emit('answerSelected', index)">
        {{ option }}
      </button>
  </div>
</template>

<script>
export default {
  props: {
    question: {
      required: true,
      type: Object
    }
  }
}
</script>

<style scoped>
  .question {
    margin: 0 2rem;
    background-color: #2B4A6F;
    padding: 1.5rem;
    border-radius: 40px;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5em;
}
</style>
