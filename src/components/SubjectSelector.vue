<template>
    <div class="grid-container">
        <button type="button" class="grid-button" @click="$emit('changeSubject', 'movies')">🍿 Movies</button>
        <button type="button" class="grid-button" @click="$emit('changeSubject', 'frontend-development')">👨‍💻 Frontend Development</button>
        <button type="button" class="grid-button" @click="$emit('changeSubject', 'video-games')">🎮 Video Games</button>
        <button type="button" class="grid-button" @click="$emit('changeSubject', 'backend-development')">🧑‍🔬 Backend Development</button>
        <button type="button" class="grid-button" @click="$emit('changeSubject', 'math')">➗ Math</button>
        <button type="button" class="grid-button" @click="$emit('changeSubject', 'random')">🎲 Random</button>
    </div>
</template>

<script>
export default {
    name: "subjectSelector"
}
</script>
