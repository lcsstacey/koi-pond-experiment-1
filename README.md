# Koi Pond Simulation Game

*Koi Pond, Experiment #1* is a browser-based koi pond simulation built with vanilla JavaScript, HTML5 canvas and CSS. It was created as a personal project to experiment with fluid animation, UI design, and interactive web effects.

## Features
- **Realistic koi movement:** Smooth, randomized swimming patterns with collision avoidance.
- **Dynamic day-night cycle:** Subtle changes in lighting and color tone over time to mimic sunrise, daylight, and dusk.
- **Interactive HUD:** Start/pause controls, rank HUD tracking koi performance, time-of-day arc, and a Zen mode to remove the HUD for a relaxing view.
- **Optional music and sound effects:** Background music and gentle water ambience (off by default).
- **Visual effects:** Blur filters, shadows, and gradient overlays to simulate depth and reflection.
- **Responsive design:** Mobile-friendly layout that adapts to different screen sizes.

## Quick Start
1. Clone or download the repository (cloning recommended to preserve file structure):

```sh
git clone https://github.com/lcsstacey/koi-pond-experiment-1.git
```

2. Open the `index.html` file in a modern web browser (e.g., Chrome, Firefox).
3. Enjoy the simulation. Use the on-screen controls to pause/resume, toggle music, or enter Zen mode.

*Note:* You don't need to install any dependencies; everything runs in the browser. If you run into security restrictions opening local HTML files, you can serve the folder with a simple HTTP server (e.g., `python -m http.server`).

## Building for iOS

The game can be packaged as a native iOS app via [Capacitor](https://capacitorjs.com). The web build (`index.html`) is loaded inside a `WKWebView`, so gameplay, audio, HUD, and visuals are byte-identical to the browser version — no engine rewrite, no behavior changes.

### Requirements
- macOS with Xcode 15+ and CocoaPods (`sudo gem install cocoapods`)
- Node.js 18+
- An Apple Developer account (only required to deploy to a physical device or the App Store)

### First-time setup
```sh
npm install
npm run ios:init      # creates the ios/ Xcode project
```

### Iterate
```sh
npm run ios:open      # syncs www/ and opens Xcode
# or
npm run ios:run       # syncs and launches the iOS Simulator
```

The `ios:sync` script copies the latest `index.html` into `www/` and runs `npx cap sync ios`, so any tweak to the game is one command away from the device build.

### Notes on visual upgrades
Because the game runs in `WKWebView`, the existing canvas rendering is preserved. Future fish visual upgrades (WebGL shaders, higher-fidelity sprites, particle effects) can be added directly to `index.html` and will appear in both the browser and the iOS build without changing the gameplay layer.

## Why this project?
This experiment explores techniques for animating multiple agents on an HTML5 canvas, implementing smooth UI interactions without external libraries, and experimenting with design aesthetics (typography, gradients, blur). It serves as a portfolio piece demonstrating front-end web skills and creative coding.

## Screenshots
You can add a screenshot or GIF here to showcase the simulation (e.g. `docs/screenshot.png`).



## License and Usage
This project is released under an **all rights reserved** license. You may view and play the koi pond simulation via the GitHub Pages link provided, but you may not copy, redistribute, or reuse the code or assets without explicit permission from the author.
