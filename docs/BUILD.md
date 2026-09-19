# Build

## Local IPA

Set `THEOS_SDKS` to the Theos SDK directory.

```bash
export THEOS_SDKS="$HOME/theos/sdks"
./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

The SDK version is selectable. The output is an IPA containing the complete `web/` frontend.

## GitHub Actions

The IPA workflow is `workflow_dispatch` only. It does not run on push.

Run **Actions → Build iOS IPAs (manual)**. The job checks out `theos/sdks`, builds every `iPhoneOS*.sdk` it finds, and creates one GitHub Release containing the IPAs. Release notes are supplied manually.

## GitHub Pages

The Pages workflow is also manual-only and publishes `web/`.
