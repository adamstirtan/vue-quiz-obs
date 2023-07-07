<template>
  <button @mouseout="handleMouseOut" @click="handleClick" :class="['grid-button', isSelected ? 'selected' : '']"
    type="button">
    <slot />
  </button>
</template>

<script setup lang="ts">
import { ref } from 'vue';

type GridButtonProps = {
  onClick: () => void;
  kind?: 'answer' | 'subject';
}

const props = defineProps<GridButtonProps>()

const isSelected = ref<boolean>(false);

const handleClick = () => {
  if (!isSelected.value && props.kind === 'answer') {
    isSelected.value = true;
    return;
  }
  props.onClick();
};

const handleMouseOut = () => {
  if (props.kind === 'answer') {
    isSelected.value = false;
  }
};

</script>

<style scoped>
.grid-button {
  background-color: #000;
  padding: 1.5rem;
  border-radius: 8px;
  border: 4px solid #fff;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5em;
  cursor: pointer;
  transition-duration: 0.4s;
}

.grid-button:hover {
  background-color: #D89F37;
}

.selected {
  background-color: green !important;
}
</style>
