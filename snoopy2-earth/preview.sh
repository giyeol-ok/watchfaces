#!/usr/bin/env bash
# snoopy2-earth preview capture: a moon-phase sweep (+0/5/10/15/20/25 days)
# cropped to the disc window, plus an AOD screenshot.
set -e

APPLICATION_ID="com.giyeol.snoopy2earth"
APK_PATH="snoopy2-earth/build/outputs/apk/debug/snoopy2-earth-debug.apk"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "$REPO_ROOT/.github/scripts/install_and_activate.sh" "$APK_PATH" "$APPLICATION_ID"

mkdir -p previews raw

for offset in 0 5 10 15 20 25; do
  stamp=$(date -d "+${offset} days" +"%m%d1200%Y.00")
  label=$(date -d "+${offset} days" +"%m-%d")
  adb shell date -s "$stamp"
  sleep 2
  adb exec-out screencap -p > "raw/moon_${offset}.png"
  ffmpeg -y -loglevel error -i "raw/moon_${offset}.png" -vf "crop=130:174:248:88" "previews/moon_+${offset}d_${label}.png"
done

adb shell date -s "$(date -u +'%m%d%H%M%Y.%S')"
adb shell input keyevent KEYCODE_SLEEP
sleep 2
adb exec-out screencap -p > previews/aod_screen.png
adb shell input keyevent KEYCODE_WAKEUP
