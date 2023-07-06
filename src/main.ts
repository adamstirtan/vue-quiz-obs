import { createApp } from "vue";
import App from "./App.vue";
import VueConfetti from "vue-confetti";

const app = createApp(App);
app.use(VueConfetti as any);
app.mount("#app");
