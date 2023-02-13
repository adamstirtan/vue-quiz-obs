<template>
    <div v-if="subject">
        <Game @endGame="endGame" :subject="subject" />
    </div>
    <div v-else>
        <SubjectSelector @changeSubject="startGame" />
    </div>
</template>

<script>
import Game from './components/Game.vue';
import SubjectSelector from './components/SubjectSelector.vue';

export default {
    name: "app",
    data() {
        return {
            subject: null
        }
    },
    methods: {
        startGame: function (subject) {
            this.subject = subject;
        },
        endGame: function () {
            this.subject = null;
        }
    },
    components: {
        Game, SubjectSelector
    }
}
</script>
