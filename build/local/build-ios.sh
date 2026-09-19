#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SDKROOT="${THEOS_SDKS:-$HOME/theos/sdks}"
OUT="$ROOT/build/out"
WORK="$ROOT/build/work"
TARGET=13.0
ARCH=arm64
SDK=""
SIGN_ID="-"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --list-sdks)
      find "$SDKROOT" -maxdepth 1 -type d -name 'iPhoneOS*.sdk' -print | sed 's#.*/##;s#\.sdk$##' | sort -V
      exit 0 ;;
    --sdk) SDK="$2"; shift 2 ;;
    --target) TARGET="$2"; shift 2 ;;
    --arch) ARCH="$2"; shift 2 ;;
    --sign) SIGN_ID="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 [--list-sdks] [--sdk VERSION] [--target VERSION] [--arch ARCH] [--sign ID]"
      exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 2 ;;
  esac
done

[ -d "$SDKROOT" ] || { echo "Theos SDK directory not found: $SDKROOT" >&2; exit 1; }
if [ -z "$SDK" ]; then
  SDK="$(find "$SDKROOT" -maxdepth 1 -type d -name 'iPhoneOS*.sdk' -print | sed 's#.*/##;s#\.sdk$##' | sort -V | tail -1 | sed 's/^iPhoneOS//')"
fi
[ -n "$SDK" ] || { echo "No iPhoneOS SDK found." >&2; exit 1; }
SDKPATH="$SDKROOT/iPhoneOS$SDK.sdk"
[ -d "$SDKPATH" ] || { echo "SDK not found: $SDKPATH" >&2; exit 1; }

CC="$(command -v clang)"
rm -rf "$OUT" "$WORK"
mkdir -p "$OUT" "$WORK/Payload/AltSourceCenter.app"
cp "$ROOT/Info.plist" "$WORK/Payload/AltSourceCenter.app/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion 2" "$WORK/Payload/AltSourceCenter.app/Info.plist" || true
cp -R "$ROOT/web" "$WORK/Payload/AltSourceCenter.app/web"

CFLAGS=(-std=c11 -O2 -Wall -Wextra -isysroot "$SDKPATH" -miphoneos-version-min="$TARGET" -arch "$ARCH")
"$CC" "${CFLAGS[@]}" -c "$ROOT/src/core/altsource.c" -o "$WORK/altsource.o"
"$CC" "${CFLAGS[@]}" -c "$ROOT/src/core/urlscheme.c" -o "$WORK/urlscheme.o"
"$CC" -isysroot "$SDKPATH" -miphoneos-version-min="$TARGET" -arch "$ARCH" -fobjc-arc -c "$ROOT/src/platform/ios/main.m" -o "$WORK/main.o"
"$CC" -isysroot "$SDKPATH" -miphoneos-version-min="$TARGET" -arch "$ARCH" "$WORK/main.o" "$WORK/altsource.o" "$WORK/urlscheme.o" -framework UIKit -framework WebKit -framework Foundation -o "$WORK/Payload/AltSourceCenter.app/AltSourceCenter"

codesign -f -s "$SIGN_ID" --timestamp=none "$WORK/Payload/AltSourceCenter.app"
codesign --verify --deep --strict --verbose=2 "$WORK/Payload/AltSourceCenter.app"
file "$WORK/Payload/AltSourceCenter.app/AltSourceCenter"
/usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "$WORK/Payload/AltSourceCenter.app/Info.plist"
(cd "$WORK" && zip -qry "$OUT/AltSourceCenter-iOS-$SDK-$ARCH.ipa" Payload)
echo "Built: $OUT/AltSourceCenter-iOS-$SDK-$ARCH.ipa"