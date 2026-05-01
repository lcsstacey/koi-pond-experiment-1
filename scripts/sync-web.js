#!/usr/bin/env node
/**
 * Copies the canonical web build (root index.html) into www/ so Capacitor
 * can bundle it into the iOS app. The root file stays the source of truth;
 * www/ is a generated, gitignored mirror.
 */
const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const wwwDir = path.join(root, 'www');

if (!fs.existsSync(wwwDir)) {
  fs.mkdirSync(wwwDir, { recursive: true });
}

const assets = ['index.html'];

for (const name of assets) {
  const src = path.join(root, name);
  const dst = path.join(wwwDir, name);
  if (!fs.existsSync(src)) {
    console.warn(`[sync-web] skip ${name} (not found)`);
    continue;
  }
  fs.copyFileSync(src, dst);
  console.log(`[sync-web] ${name} -> www/${name}`);
}

console.log('[sync-web] done');
