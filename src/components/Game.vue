<template>
    <div v-if="gameOver">
        <GameOver :result="gameResult" @startOverClicked="startOver" />
    </div>
    <div v-else>
        <div class="options">
            <button type="button" class="option" :disabled="askFriend" @click="useAskAFriend">☎️</button>
            <button type="button" class="option" :disabled="askAudience" @click="useAskTheAudience">📊</button>
            <button type="button" class="option" @click="confirmEndGame">🔄️</button>
        </div>
        <div v-if="question">
            <Question :question="question" @answerSelected="answerSelected" />
        </div>
    </div>
</template>

<script setup lang="ts">
import GameOver from "./GameOver.vue";
import Question from "./Question.vue";
import { ref, onMounted, getCurrentInstance } from 'vue'

export type Question = {
    title: string;
    options: string[];
    answer: number;
};

type SubjectProps = { subject: string }
const { subject } = defineProps<SubjectProps>()

const gameOver = ref(false);
const gameResult = ref(false);
const questions = ref<Question[]>([]);
const question = ref<Question | null>(null);
const round = ref(0);
const askFriend = ref(false);
const askAudience = ref(false);
const confetti = getCurrentInstance()?.appContext.config.globalProperties.$confetti;

onMounted(() => {
    const subjectFile = `./${subject}.json`;
    fetch(subjectFile)
        .then((response) => response.json())
        .then((json) => {
            questions.value = json.sort(() => 0.5 - Math.random()).slice(0, 5);
            nextQuestion();
        });
})

const emit = defineEmits(['endGame'])

const confirmEndGame = () => {
    if (confirm("End the game?")) emit("endGame");
};

const answerSelected = (index: number) => {
    if (!(index == question.value?.answer)) lose();

    round.value += 1;
    if (round.value === 5) {
        win();
    } else {
        nextQuestion();
    }
};

const win = () => {
    gameResult.value = true;
    gameOver.value = true;
    confetti.start();
}

const lose = () => {
    gameResult.value = false;
    gameOver.value = true;
};

const nextQuestion = () => {
    question.value = questions.value[round.value];
}
const useAskAFriend = () => {
    askFriend.value = true;
};
const useAskTheAudience = () => {
    askAudience.value = true;
}

const startOver = () => {
    emit("endGame");
    confetti.stop();
};


</script>

<style scoped>
.options {
    padding: 0 2rem 1rem 2rem;
    display: grid;
    grid-auto-flow: column;
    column-gap: 1rem;
    justify-content: end;
}

.option {
    background-color: #666;
    cursor: pointer;
    transition-duration: 0.4s;
    font-size: 2em;
    padding: 1rem;
    border-radius: 8px;
    border: 4px solid #fff;
    width: 85px;
    height: 85px;
}

.option:hover:not([disabled]) {
    background-color: #444;
}

.option:disabled {
    cursor: not-allowed;
    opacity: 0.5;
}
</style>
