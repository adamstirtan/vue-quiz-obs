# Vue Quiz Game

This is a web application for conducting quiz game shows on video calls. I'm using a browser scene object in OBS to overlay the web application over top of the contestant's video source.

![image](https://user-images.githubusercontent.com/9989813/218371661-a98a68e7-f8d2-4af9-bbef-2b116320a1a5.png)

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

# Project Setup

## Traditional setup

### Install Node

[Follow the instructions to install nodejs here](https://nodejs.org/en/download/current)

### Install Dependencies

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

## Nix Setup

[Nix](https://nixos.org/) empowers us to create declarative reproducible environments and builds of packages with ease. You can run the following to install it:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

There are a couple pieces of configuration we want to make sure nix runs at its best. Run the following bash snippet to get that set up.

```bash
mkdir -p ~/.config/nix/
echo 'max-jobs = auto' >>~/.config/nix/nix.conf
echo 'experimental-features = nix-command flakes' >>~/.config/nix/nix.conf
echo 'extra-platforms = aarch64-darwin x86_64-darwin' >>~/.config/nix/nix.conf
```

Then add the following to your shell’s rc file in your home directory (e.g. `~/.zshrc` or `~/.bashrc`) to get it in your path:

```bash
source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
```

Then **fully restart** your terminal.

## Direnv

Direnv is a tool that automatically loads and unloads environment variables when you enter or leave directories with a `.envrc` file. Combining this with nix allows us to automatically download, install, and preparing the necessary libraries for developing the app. Here's how you can install it with nix:

```bash
nix-env -iA nixpkgs.direnv
```

Make sure you install the `direnv` hook for your shell. A line like this should exist in your shell's rc file (and it **needs** to be below the nix line mentioned above):

```bash
eval "$(direnv hook "$SHELL")"
```

If you didn’t already have `direnv`, you will probably want to **restart your terminal** again.

Now when you open up the repo in your terminal, you'll be prompted to run `direnv allow` which tells direnv you trust the `.envrc` in this directory. The first time you do this it can take a couple of minutes to complete. That's because it will be installing all the system and dev dependencies needed for this repo. What's even cooler is that because of the direnv integration, these tools will automatically be scoped to this specific directory. So you don't have to worry about the versions mis-matching with other projects.

Now you can use all the traditional commands like `npm install` and `npm run dev` to develop the app.
