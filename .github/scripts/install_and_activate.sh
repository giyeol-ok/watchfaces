#!/usr/bin/env bash
# Common helper: install a watch face APK on the running emulator and
# activate it via the DEBUG_SURFACE broadcast, retrying until Wear system
# services (picker, companion sync) have settled. Any watch face's preview
# script can source or call this before taking screenshots.
#
# Usage: install_and_activate.sh <path-to-apk> <application-id>
set -e

APK_PATH="$1"
APPLICATION_ID="$2"

if [ -z "$APK_PATH" ] || [ -z "$APPLICATION_ID" ]; then
  echo "Usage: install_and_activate.sh <path-to-apk> <application-id>" >&2
  exit 1
fi

adb root
sleep 2
adb wait-for-device
adb shell 'while [ "$(getprop sys.boot_completed)" != "1" ]; do sleep 1; done'
# Let Wear system services (the watch face picker, companion sync) finish
# settling before we ask them to switch watch faces.
sleep 20

adb install -r "$APK_PATH"
sleep 10

set +e
activated=0
for attempt in 1 2 3 4 5 6; do
  result=$(adb shell am broadcast -a com.google.android.wearable.app.DEBUG_SURFACE --es operation set-watchface --es watchFaceId "$APPLICATION_ID")
  echo "$result"
  if echo "$result" | grep -q "result=1"; then
    activated=1
    break
  fi
  sleep 10
done
set -e

if [ "$activated" != "1" ]; then
  echo "::error::set-watchface broadcast never returned result=1 after 6 attempts; refusing to capture screenshots of the wrong watch face."
  exit 1
fi

# Give the newly-activated face a moment to actually render before screenshotting.
sleep 3
