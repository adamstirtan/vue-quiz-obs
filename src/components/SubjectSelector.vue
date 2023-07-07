<template>
    <div class="subject-container">
        <GridButton :onClick="handleSubjectClick('frontend-development')">👨‍💻 Frontend Development</GridButton>
        <GridButton :onClick="handleSubjectClick('backend-development')">🧑‍🔬 Backend Development</GridButton>
        <GridButton :onClick="handleSubjectClick('video-games')">🎮 Video Games</GridButton>
        <GridButton :onClick="handleSubjectClick('movies')">🍿 Movies</GridButton>
        <GridButton :onClick="handleSubjectClick('random')">🎲 Random</GridButton>
        <GridButton :onClick="handleSubjectClick('math')">➗ Math</GridButton>
    </div>
</template>

<script setup lang="ts">
import GridButton from "./GridButton.vue";

const emit = defineEmits(['changeSubject'])

const handleSubjectClick = (subject: string) => () => {
    emit('changeSubject', subject);
}
</script>


<style scoped>
.subject-container {
    display: grid;
    padding: 2rem;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
}
</style>
