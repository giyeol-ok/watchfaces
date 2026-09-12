# Watchfaces

A monorepo for Wear OS Watch Face Format projects, sharing one Gradle build
setup and one CI pipeline across watch faces.

## Structure

```
watchfaces/
├── build.gradle.kts, settings.gradle.kts, gradle/   — shared Gradle setup
├── .github/
│   ├── workflows/build-and-preview.yml              — path-filtered CI
│   └── scripts/install_and_activate.sh              — shared: install + activate a watch face on the emulator
├── docs/previews/<watch-face>/                       — auto-committed preview screenshots per watch face
└── <watch-face>/                                     — one directory per watch face, each its own Gradle module
    ├── build.gradle.kts
    ├── preview.sh                                    — that watch face's own CI preview capture logic
    └── src/main/...
```

`settings.gradle.kts` auto-includes every top-level directory that has its
own `build.gradle.kts` as a Gradle module - no manual wiring needed when
adding a watch face.

## Adding a new watch face

1. Create `<name>/` with a `build.gradle.kts` (see `moonswatch-snoopy/` for
   reference) and the usual `src/main/AndroidManifest.xml` +
   `src/main/res/{raw/watchface.xml, drawable, values, xml}`.
2. Write `<name>/preview.sh` - call
   `.github/scripts/install_and_activate.sh <apk-path> <application-id>`
   first, then capture whatever screenshots make sense for that face.
3. In `.github/workflows/build-and-preview.yml`, add `<name>` to the
   `paths-filter` block and copy the `build-moonswatch-snoopy` /
   `preview-moonswatch-snoopy` job pair, swapping the module name.

CI only builds and previews the watch face(s) whose files actually changed
in a given push.

### Standard requirements for every watch face

- **Sweeping second hand**: any `<SecondHand>` must include
  `<Sweep frequency="SYNC_TO_DEVICE" />` so it glides continuously instead
  of ticking once per second. This applies to every second hand in the
  watch face, including per-style variants (e.g. multiple `ListOption`
  dial styles that each declare their own `AnalogClock`).
- **Ambient/AOD compliance**: hide the second hand in ambient mode with
  `<Variant mode="AMBIENT" target="alpha" value="0" />` (WFF ambient mode
  cannot render a continuously animating hand), and keep at least 85% of
  the display dark/dim in ambient to stay within the Wear OS 15%-lit-pixel
  guideline - see `rolex-deepsea/` for the pattern (a dedicated dimmed
  `dial_aod` image swapped in only under `AMBIENT`).

## Watch faces in this repo

- [`moonswatch-snoopy/`](moonswatch-snoopy/README_KO.md) - Omega x Swatch
  Moonswatch-styled dial with a rotating Snoopy moon-phase disc.
- `moonswatch-snoopy2/` - a from-photo rebuild of the Moonswatch Snoopy dial,
  with hour/minute hands from centre and a small-seconds hand in the 6
  o'clock subdial.
- `rolex-deepsea/` - Rolex Deepsea-styled dial (Mercedes hour hand, dagger
  minute hand, sweep seconds hand) with a live day-of-month date window at
  3 o'clock.
