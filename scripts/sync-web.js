#!/usr/bin/env node
/**
 * Builds the www/ bundle Capacitor ships into the iOS app.
 *
 * The root index.html is the canonical source for the browser build and
 * stays untouched. This script copies it into www/ and applies iOS-only
 * tweaks (safe-area viewport, home-indicator padding) so the game lays
 * out correctly on notched devices without changing gameplay code.
 */
const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const wwwDir = path.join(root, 'www');

if (!fs.existsSync(wwwDir)) {
  fs.mkdirSync(wwwDir, { recursive: true });
}

const srcIndex = path.join(root, 'index.html');
if (!fs.existsSync(srcIndex)) {
  console.error('[sync-web] index.html missing at repo root');
  process.exit(1);
}

let html = fs.readFileSync(srcIndex, 'utf8');

const VIEWPORT_RE = /<meta\s+name="viewport"[^>]*>/i;
const newViewport = '<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,viewport-fit=cover">';
if (VIEWPORT_RE.test(html)) {
  html = html.replace(VIEWPORT_RE, newViewport);
} else {
  console.warn('[sync-web] no viewport meta found; injecting one');
  html = html.replace(/<head>/i, `<head>\n${newViewport}`);
}

const iosCss = `
<style id="capacitor-ios-overrides">
  /* Push fixed-bottom UI above the home indicator */
  #ui { padding-bottom: env(safe-area-inset-bottom, 0px); }
  #menu { border-radius: 16px 16px 0 0; }
  /* Keep top-anchored controls clear of the notch / Dynamic Island */
  .topbtn, #seasonBadge { margin-top: env(safe-area-inset-top, 0px); }
  #notifStack { padding-top: env(safe-area-inset-top, 0px); }
  /* Disable iOS pull-to-refresh / rubber-banding inside the canvas */
  html, body { overscroll-behavior: none; }
</style>
`;
if (/<\/head>/i.test(html)) {
  html = html.replace(/<\/head>/i, `${iosCss}</head>`);
} else {
  console.warn('[sync-web] no </head> found; iOS CSS not injected');
}

fs.writeFileSync(path.join(wwwDir, 'index.html'), html);
console.log('[sync-web] index.html -> www/index.html (with iOS safe-area overrides)');

// Copy the designs/ folder verbatim — those pages already include their
// own viewport meta and safe-area padding, and use an inner scroll wrapper
// so they work inside the WKWebView (which has scrollEnabled=false).
const designsSrc = path.join(root, 'designs');
const designsDst = path.join(wwwDir, 'designs');
if (fs.existsSync(designsSrc)) {
  fs.rmSync(designsDst, { recursive: true, force: true });
  fs.cpSync(designsSrc, designsDst, { recursive: true });
  console.log('[sync-web] designs/ -> www/designs/');
}

console.log('[sync-web] done');
