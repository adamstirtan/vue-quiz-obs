<template>
    <div :style="{ height: '100%' }"></div>
    <Game v-if="selectedSubject" @endGame="endGame" :subject="selectedSubject" />
    <SubjectSelector v-else @changeSubject="startGame" />
</template>

<script setup lang="ts">
import Game from './components/Game.vue';
import SubjectSelector from './components/SubjectSelector.vue';
import { ref } from 'vue'

const selectedSubject = ref<string | null>(null);
const startGame = (subject: string) => {
    selectedSubject.value = subject;
};

const endGame = () => {
    selectedSubject.value = null;
}
</script>
