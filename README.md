# AltSource Center

Native iPhone/iPad AltSource browser and sideload helper, plus a static GitHub Pages edition.

## Features
- Browse/search AltStore-compatible sources and apps (core model is being expanded).
- Source management and app details.
- Open supported sideloading URL schemes.
- Native UIKit iOS/iPadOS IPA; no WebView.
- C11 core + small Objective-C UIKit bridge.
- Manual GitHub Actions builds only.
- GitHub Pages static edition in `docs/`.

## Build locally
Set `THEOS_SDKS` to the Theos SDK `sdks` directory:

```bash
./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 15.0 --arch arm64
```

The IPA is ad-hoc signed for sideloading/re-signing, not App Store distribution.

## Sources
This is a clean-room rewrite inspired by the functionality of AltDirect and AltSource Viewer. Their branding/assets remain subject to their own licenses.

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealfoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks
