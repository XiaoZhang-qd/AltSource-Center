#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SDKROOT="${THEOS_SDKS:-$HOME/theos/sdks}"
OUT="$ROOT/build/out"; WORK="$ROOT/build/work"
TARGET=13.0; ARCH=arm64; SDK=""
while [ "$#" -gt 0 ]; do
 case "$1" in
  --list-sdks) find "$SDKROOT" -maxdepth 1 -type d -name 'iPhoneOS*.sdk' -print | sed 's#.*/##; s#\.sdk$##' | sort -V; exit 0;;
  --sdk) SDK="$2"; shift 2;; --target) TARGET="$2"; shift 2;; --arch) ARCH="$2"; shift 2;;
  -h|--help) echo "Usage: $0 [--list-sdks] [--sdk VERSION] [--target VERSION] [--arch ARCH]"; exit 0;;
  *) echo "Unknown option: $1" >&2; exit 2;; esac
done
if [ -z "$SDK" ]; then SDK="$(find "$SDKROOT" -maxdepth 1 -type d -name 'iPhoneOS*.sdk' -print | sed 's#.*/##; s#\.sdk$##' | sort -V | tail -1 | sed 's/^iPhoneOS//')"; fi
[ -n "$SDK" ] || { echo "No iPhoneOS SDK found" >&2; exit 1; }
SDKPATH="$SDKROOT/iPhoneOS$SDK.sdk"; [ -d "$SDKPATH" ] || { echo "SDK not found: $SDKPATH" >&2; exit 1; }
UIKIT_TBD="$SDKPATH/System/Library/Frameworks/UIKit.framework/UIKit.tbd"
if [ -f "$UIKIT_TBD" ] && grep -q 'platform: ios-simulator' "$UIKIT_TBD"; then exit 3; fi
CLANG="$(xcrun --find clang 2>/dev/null || command -v clang)"
rm -rf "$OUT" "$WORK"; mkdir -p "$OUT" "$WORK/Payload/AltSourceCenter.app"
cp "$ROOT/Info.plist" "$WORK/Payload/AltSourceCenter.app/Info.plist"
cp -R "$ROOT/web" "$WORK/Payload/AltSourceCenter.app/web"
CFLAGS=(-std=c11 -O2 -Wall -Wextra -isysroot "$SDKPATH" -miphoneos-version-min="$TARGET" -arch "$ARCH")
"$CLANG" "${CFLAGS[@]}" -fobjc-arc -c "$ROOT/src/platform/ios/main.m" -o "$WORK/main.o"
"$CLANG" -isysroot "$SDKPATH" -miphoneos-version-min="$TARGET" -arch "$ARCH" "$WORK/main.o" -framework UIKit -framework WebKit -o "$WORK/Payload/AltSourceCenter.app/AltSourceCenter"
codesign -f -s - "$WORK/Payload/AltSourceCenter.app"
(cd "$WORK" && zip -qry "$OUT/AltSourceCenter-iOS-$SDK-$ARCH.ipa" Payload)