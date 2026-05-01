# Seisuitei — Native SpriteKit Port (skeleton)

This directory is a parallel, native-iOS implementation of the koi pond using [SpriteKit](https://developer.apple.com/spritekit/). It is **not** required to ship the game on iOS — the Capacitor wrapper in the repo root already does that with the canvas version unchanged.

This skeleton exists for the "spice up the fish" path: replacing the canvas fish with native sprites, shaders, and lighting while keeping the rest of the game's behavior (day/night, ranks, audio, HUD) intact via the Capacitor build until each system is migrated.

## Status

This is a starting point, not a finished port. It contains:

- An `AppDelegate` and `GameViewController` that boot a full-screen `SKView`.
- A `GameScene` that sets up the pond background and spawns koi.
- A `Koi` node implementing wander + collision-avoidance steering, mirroring the JS version's feel.

It does **not** yet include: HUD, menu, ranks, day/night cycle, audio, season badge, or any of the UI from `index.html`. Those continue to live in the web build.

## Setup

1. Open Xcode (15+).
2. **File → New → Project → iOS → Game**, choose **SpriteKit** as the Game Technology and **Swift** as the language. Name it `Seisuitei`.
3. Delete Xcode's generated `GameScene.swift`, `GameScene.sks`, and `Actions.sks`.
4. Drag the contents of `KoiPond/` into the project (check "Copy items if needed").
5. In `Info.plist`, set **Status bar style** to dark and **Requires full screen** to YES.
6. Build & run on the simulator or a device.

## Migration plan

1. Ship the Capacitor build to TestFlight (current main path).
2. Iterate on `Koi.swift`: better sprites, body-segment articulation, shader for scales, water caustics.
3. Replace the WKWebView's fish layer with a transparent `SKView` overlay, leaving HUD/audio/ranks in the web layer.
4. Once parity is reached on every visible system, retire the web layer.
