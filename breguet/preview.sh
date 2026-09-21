#!/usr/bin/env bash
# breguet specific preview capture: a short screen recording of active mode
# (to actually show the tourbillon cage sweep and hands moving, not just a
# static frame) plus an AOD screenshot. Calls the shared
# .github/scripts/install_and_activate.sh helper first.
set -e

APPLICATION_ID="com.giyeol.breguet"
APK_PATH="breguet/build/outputs/apk/debug/breguet-debug.apk"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "$REPO_ROOT/.github/scripts/install_and_activate.sh" "$APK_PATH" "$APPLICATION_ID"

mkdir -p previews raw

# Active mode: record a few seconds so the continuously-sweeping tourbillon
# cage and the hands are visibly moving, not just a still frame.
adb shell screenrecord --time-limit 10 --bit-rate 6000000 /sdcard/breguet_active.mp4
adb pull /sdcard/breguet_active.mp4 raw/breguet_active.mp4
adb shell rm /sdcard/breguet_active.mp4
ffmpeg -y -loglevel error -i raw/breguet_active.mp4 -vf "fps=12,scale=450:-1:flags=lanczos" previews/breguet_active.gif

adb exec-out screencap -p > previews/breguet_active_screenshot.png

# AOD: sleep to trigger ambient mode, screenshot, then wake back up.
adb shell input keyevent KEYCODE_SLEEP
sleep 2
adb exec-out screencap -p > previews/breguet_aod.png
adb shell input keyevent KEYCODE_WAKEUP
