<script setup>

</script>

<template>
  <div class="question">Who is Superman?</div>
  <div class="answers">
    <div class="answer">A guy from Krypton</div>
    <div class="answer">Soup || Man</div>
    <div class="answer">Klart Cent</div>
    <div class="answer">Bruce Wayne</div>
  </div>
</template>

<style scoped>
body {
  background-color: green;
}

h1 {
  text-align: center;
}

.question {
  text-align: center;
  border: 2px solid #fff;
  border-radius: 10px;
  background-color: #333;
  margin: 0 100px;
  padding: 2rem;
  color: #fff;
  font-size: 32px;
  font-family: Helvetica;
}

.answers {
  margin: 20px auto;
  width: 800px;
  display: grid;
  grid-template-columns: 400px 400px;
  grid-row: auto auto;
  grid-column-gap: 20px;
  grid-row-gap: 20px;
}

.answer {
  background-color: #333;
  padding: 1.5rem;
  border-radius: 10px;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  font-family: Helvetica;
  cursor: pointer;
}

.answer:hover {
  background-color: #444;
}
</style>
