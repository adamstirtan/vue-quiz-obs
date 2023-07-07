<template>
    <div class="result-container">
        <div v-if="result">
            🥳 You win!
        </div>
        <div v-else>
            😢 You lose!
        </div>
        <button type="button" @click="emit('startOverClicked')">Start over</button>
    </div>
</template>

<script setup lang="ts">
type GameOverProps = { result: boolean }
const { result } = defineProps<GameOverProps>()

const emit = defineEmits(['startOverClicked'])

</script>

<style scoped>
.result-container {
    text-align: center;
    font-size: 4em;
    padding: 2rem;
}

button {
    padding: 1em;
}
</style>
