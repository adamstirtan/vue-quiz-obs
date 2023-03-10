<template>
    <div v-if="gameOver">
        <GameOver :result="gameResult" @startOverClicked="startOver" />
    </div>
    <div v-else>
        <div class="options">
            <button type="button" class="option" :disabled="askFriend" @click="askFriendUsed">☎️</button>
            <button type="button" class="option" :disabled="askAudience" @click="askAudienceUsed">📊</button>
            <button type="button" class="option" @click="confirmEndGame">🔄️</button> 
        </div>
        <div v-if="question">
            <Question :question="question" @answerSelected="answerSelected" />
        </div>
    </div>
</template>

<script>
import GameOver from "./GameOver.vue";
import Question from "./Question.vue";

export default {
    name: "game",
    data() {
        return {
            gameOver: false,
            gameResult: false,
            questions: [],
            question: null,
            round: 0,
            askFriend: false,
            askAudience: false
        }
    },
    props: {
        subject: {
            required: true,
            type: String
        }
    },
    mounted() {
        const subjectFile = `./${this.subject}.json`;

        fetch(subjectFile)
            .then((response) => response.json())
            .then((json) => {
                this.questions = json.sort(() => 0.5 - Math.random()).slice(0, 5);
                this.nextQuestion();
            });
    },
    methods: {
        newGame(subject) {
            this.subject = subject;
            this.round = 1;
            this.askFriend = false;
            this.askAudience = false;
        },
        confirmEndGame() {
            if (confirm("End the game?")) {
                this.$.emit("endGame");
            }
        },
        answerSelected: function(index) {
            if (index == this.question.answer) {
                if (++this.round === 5) {
                    this.win();
                } else {
                    this.nextQuestion();
                }
            } else {
                this.lose();
            }
        },
        win() {
            this.gameResult = true;
            this.gameOver = true;
        },
        lose() {
            this.gameResult = false;
            this.gameOver = true;
        },
        nextQuestion() {
            this.question = this.questions[this.round];
        },
        askFriendUsed() {
            this.askFriend = true;
        },
        askAudienceUsed() {
            this.askAudience = true;
        },
        startOver() {
            this.$.emit("endGame");
        }
    },
    components: {
        GameOver, Question
    }
}
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
    .option:hover {
        background-color: #444;
    }
    .option:disabled {
        display: none;
    }
</style>