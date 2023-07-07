declare module "vue-confetti" {
  interface ParticleOptions {
    type?: string;
    size?: number;
    dropRate?: number;
    colors?: Array<string>;
  }

  interface ConfettiOptions {
    particles?: Array<ParticleOptions>;
    defaultType?: string;
    defaultSize?: number;
    defaultDropRate?: number;
    defaultColors?: Array<string>;
    canvasId?: string;
    particlesPerFrame?: number;
  }

  export default class VueConfetti {
    install(Vue: Vue, options: ConfettiOptions): void;
    start(opts?: ConfettiOptions): void;
    stop(): void;
  }
}
