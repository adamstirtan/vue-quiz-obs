<template>
  <div class="question">{{ question.title }}</div>
  <div class="answers-container">
    <GridButton v-for="(option, index) in question.options" :key="question.title"
      :onClick="() => $.emit('answerSelected', index)" kind="answer">
      {{ option }}
    </GridButton>

  </div>
</template>

<script setup lang="ts">
import GridButton from "./GridButton.vue";
import { type Question } from "./Game.vue";

type QuestionProps = { question: Question }
const { question } = defineProps<QuestionProps>()

</script>

<style scoped>
.question {
  margin: 0 2rem;
  background-color: #000;
  padding: 1.5rem;
  border-radius: 8px;
  border: 4px solid #fff;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5em;
}

.answers-container {
  display: grid;
  padding: 2rem;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 1rem;
}
</style>
