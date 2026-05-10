<div align="center">

# 静水庭

### Seisuitei

*A meditative koi pond, hand‑rendered on canvas.*

[**Live demo →**](https://lcsstacey.github.io/koi-pond-experiment-1/)

<!-- Drop a hero screenshot or GIF here when ready: -->
<!-- <img src="docs/hero.png" alt="Seisuitei koi pond" width="820"> -->

</div>

---

## Overview

Seisuitei is a single‑page koi pond simulation written from scratch in vanilla JavaScript and the HTML5 canvas. It started as an experiment in fluid agent animation and quietly grew into a small world: nineteen varieties of nishikigoi, four biomes, ambient procedural audio, weather, and a handful of troublesome visitors who occasionally drift in to scatter the fish.

It is also a study in restraint. The whole game ships as one HTML file, with no build step and no runtime dependencies. The same file is wrapped in a `WKWebView` for the iOS build, so the browser version and the device version are byte‑identical.

## What's in the pond

**19 koi varieties** rendered with per‑species patterns, drifting through four biomes.

| | |
| :--- | :--- |
| **Common** | Kohaku · Showa Sanke · Kumonryu · Benigoi · Doitsu · Ochiba Shigure · Tancho · Platinum Ogon · Kikokuryu · Ghost · Asagi · Yamabuki Ogon |
| **Native legends** | Goshiki · Karasugoi · Hariwake · Kujaku |
| **Wandering legends** | Shinju no Ryu · Akeboshi · Tsukihana · Suiryusei |
| **Troublesome visitors** | Aosagi (heron) · Yamame (river trout) · Suppon (soft‑shell turtle) · Ushigaeru (bullfrog) |

## Worlds

Four hand‑tuned biomes, each with its own palette, particle system, ambient pad, and resident wildlife.

- **Garden** — lily pads, blossoms, an occasional bullfrog among the pads.
- **Rocky Cove** — driftwood, eels, snappers, and a roaming trout.
- **Twilight** — fireflies, distant moonlight, the silhouette of a heron sweeping across.
- **Autumn** — falling leaves, lanterns in season, a soft‑shell turtle traversing the deep.

## Craft notes

- **Pure canvas.** No engine, no framework, no shader pipeline. Every fish, ripple, and shadow is drawn by hand each frame.
- **Per‑species pattern dispatch.** Each variety is rendered by its own pattern function — Kohaku patches, Asagi indigo net, Doitsu mirror dorsal scales, Goshiki five‑colour streaks, Shinju iridescent halo.
- **Mood system.** Every koi carries a slowly drifting mood (calm, playful, sleepy, social, hungry) that changes its swim speed, depth preference, and how readily it notices a pellet.
- **Procedural audio.** Pads, motifs, and bells are synthesised with the Web Audio API and routed through a small convolution reverb. No samples are shipped.
- **Persistent koi.** Each pond remembers the fish that lived in it — names, traits, colours, and the days they have visited.
- **Snapshot pause.** Opening the menu freezes the pond into a single blurred snapshot rather than re‑blurring the live canvas every frame.
- **Zen mode.** A button hides the HUD entirely so the pond is the only thing on screen.

## Stack

`HTML5 Canvas` · `Vanilla JS` · `Web Audio API` · `Capacitor` (iOS wrapper)

## Project layout

```
.
├── index.html              ← the entire game (one file, no build)
├── designs/                ← reference sheets used during art design
│   └── brand_koi_specimens.html
├── ios-native/             ← optional native SpriteKit port skeleton
├── scripts/sync-web.js     ← copies index.html into the Capacitor www/ tree
├── capacitor.config.json
└── package.json
```

## iOS build

The game is packaged for iOS with [Capacitor](https://capacitorjs.com). The web canvas is loaded inside a `WKWebView`, so gameplay, audio, and visuals match the browser exactly.

```sh
npm install
npm run ios:init      # one‑time: creates the ios/ Xcode project
npm run ios:open      # syncs www/ and opens Xcode
npm run ios:run       # syncs and launches the iOS Simulator
```

Requirements: macOS with Xcode 15+, Node 18+, CocoaPods, and an Apple Developer account if deploying to a device.

## License

© 2026 Lucas Stacey. All rights reserved.

This repository is published as a portfolio piece. The source, art, and audio synthesis are not licensed for reuse, redistribution, or derivative works. You are welcome to view the code and play the [live demo](https://lcsstacey.github.io/koi-pond-experiment-1/) — please do not copy it.

For licensing enquiries, open an issue.
