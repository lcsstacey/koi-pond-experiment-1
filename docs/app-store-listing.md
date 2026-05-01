# App Store Listing — Seisuitei

Reference copy for the App Store Connect submission. Lengths shown are
Apple's hard limits at time of writing.

---

## App Name (30 char max)
```
Seisuitei
```
9 chars. Keep it. The name is doing the work.

If "Seisuitei" alone feels too cryptic on the storefront, use:
```
Seisuitei: Koi Pond
```
19 chars.

---

## Subtitle (30 char max)
Three options, in order of preference:
```
A koi pond, gently kept
```
22 chars. Mood-first.
```
Quiet koi for restless days
```
27 chars. Says what it is for.
```
A small pond. Yours to keep.
```
28 chars. Personal.

---

## Promotional Text (170 char max — editable without resubmission)
```
A handful of koi, a slow afternoon, weather you can change at a glance. New seasons arrive on their own. Nothing to win, nothing to grind. Sit a while.
```
150 chars.

---

## Keywords (100 char max, comma-separated, no spaces after commas)
```
koi,pond,zen,relax,calm,ambient,fish,japanese,garden,meditation,simulation,idle,aesthetic,nature
```
98 chars. Apple already indexes the app name and category — don't repeat
"Seisuitei" or the category name here.

---

## Description (4000 char max — first ~3 lines visible above the fold)

```
A small pond, kept gently.

Seisuitei is a koi pond you tend at your own pace. Twelve fish drift between
floating leaves while a quiet day passes overhead — sunrise, noon, dusk,
night, and back again. Drop a pellet now and then. Watch a season turn.
Listen to the rain.

— A LIVING POND —
Koi swim with their own habits. Each one has a name, a temperament, and a
history of the days you've spent with them. Some grow large. Some stay shy.
A few rare varieties only appear under the right weather, in the right
season, after enough quiet time.

— FOUR SCENES —
Garden, Rocky Cove, Twilight, and Autumn. Each has its own light, its own
palette, its own creatures lurking at the edges. Switch between them when
the mood asks for something new.

— WEATHER & TIME —
Clear, rain, mist, or storm. Sunrise to night, on a slow loop you can
forget about. Or pause time and let the pond hold still.

— ZEN MODE —
Hide the interface entirely. Just water and fish.

— NO ACCOUNTS, NO ADS, NO TRACKING —
Seisuitei collects no data. It works fully offline. Your pond saves to your
device and stays there. There is nothing to buy, nothing to unlock with
money, no notifications begging you to come back.

A side experiment by Lucas Stacey, made for the kind of evening that
deserves something quieter than another feed.
```

~1440 chars. Under the limit with room to add an "— WHAT'S NEW IN 1.0 —"
section before launch.

---

## What's New in This Version (4000 char max — per release)
For 1.0:
```
First release.
```
For subsequent updates, lead with the change a tester would actually feel
("Calmer dusk lighting." "New variety: Tsukihana, on misty nights.") rather
than internal refactors.

---

## Categories
- **Primary:** Games
  - **Subcategory:** Simulation (or Casual — Simulation reads more honest)
- **Secondary:** Lifestyle

Don't pick "Entertainment" — it's a junk drawer.

---

## Age Rating
- 4+ (no objectionable content of any kind)
- Answer "No" to every question in the age-rating questionnaire

---

## App Privacy (App Privacy section in App Store Connect)
- **Data collection:** None
- **Tracking:** No
- **Privacy Policy URL:** `https://lcsstacey.github.io/koi-pond-experiment-1/privacy.html`
  (host `docs/privacy.html` via GitHub Pages — Settings → Pages → branch:
  main, folder: /docs)
- **Data Linked to You:** None
- **Data Used to Track You:** None

---

## Support / Marketing URLs
- **Support URL** (required):
  Use the GitHub repo's Issues tab as a placeholder if you don't have a site:
  `https://github.com/lcsstacey/koi-pond-experiment-1/issues`
- **Marketing URL** (optional): the GitHub Pages site once enabled

---

## Pricing & Availability
- Free, all territories, no in-app purchases.
- If you ever change to paid, do it after launch (Apple lets you switch
  later; switching from paid to free is one-way without a re-review).

---

## Screenshots — what you actually need
Apple requires at least one set; the **6.7" iPhone** set is the modern
floor. iPad screenshots are required only if the app supports iPad.

| Device | Resolution | Required |
|---|---|---|
| 6.7" iPhone (15 Pro Max) | 1290 × 2796 | Yes |
| 6.5" iPhone (older) | 1242 × 2688 | Optional, recommended |
| 5.5" iPhone (legacy) | 1242 × 2208 | No (Apple stopped requiring this) |
| 13" iPad Pro (M4) | 2064 × 2752 | Required if app supports iPad |
| 12.9" iPad Pro (gen 6) | 2048 × 2732 | Recommended |

Suggested 5-shot sequence:
1. Hero — Garden scene, mid-day, koi visible, no UI
2. Twilight scene with rank HUD visible
3. Pause screen showing the journal with a few discovered varieties
4. A rare/legendary catch (e.g. Tancho, Shinju no Ryu)
5. Zen mode — pure water and fish

Take them on a real device or in the iOS Simulator (`File → New
Screenshot`). Keep them screenshots — Apple now allows light text overlays,
but for a meditative app the unadorned shots will do more work.

---

## Encryption Export Compliance
In `Info.plist` add:
```xml
<key>ITSAppUsesNonExemptEncryption</key>
<false/>
```
The app only uses standard HTTPS (and not even that, since it's offline) —
this declaration exempts you from yearly export forms.

---

## Submission notes
- **Bundle ID:** `com.seisuitei.koipond` — claim it on App Store Connect
  before someone else does.
- **First Beta App Review** for external TestFlight typically takes
  24–48 h. Subsequent builds in the same train don't need re-review.
- **First App Store Review** also 24–48 h, sometimes a few days. Common
  rejections for an app like this: missing privacy policy URL, screenshots
  showing UI you don't actually ship, support URL that 404s.
