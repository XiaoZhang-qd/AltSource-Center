<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

English · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

C11-first, local-first AltSource browser for iPhone/iPad. The UI is bundled into the IPA itself and is designed to feel more like an F-Droid-style software catalog: **Sources → Apps → Details → Get / Add Source**.

## What changed

This repository now combines the original AltSource Center native shell with the useful interaction model of AltDirect and AltSource Viewer:

- Local source library.
- Add Source button and source details.
- Apps page with search.
- Per-app Get flow.
- Separate Add Source flow.
- URL-client page with editable handler registry.
- English / 简体中文 / 繁體中文 and additional UI languages.
- Local export/import of the source library.
- The IPA contains the complete `web/` front end; it is not a remote website packaged as a link.
- C11 core remains responsible for the handler model; iOS uses a small UIKit/WebKit bridge.
- Home page includes a button to copy the current Web URL and a link to GitHub Releases.

## URL protocol support

The project is deliberately configuration-driven. There is no single authoritative list of every AltSource-compatible client, and source support does not imply IPA-install support. URL schemes may change between client versions.

Current source handlers include:

- AltStore Classic — `altstore-classic://source?url=...`
- SideStore — `sidestore://source?url=...`
- Feather — `feather://source/...`
- LiveContainer — `livecontainer://sources?url=...`
- StikStore — `stikstore://add-source?url=...`
- TrollApps — `trollapps://add?url=...`
- FlareStore — `flarestore://source?url=...`
- ESign — `esign://addsource?url=...`
- Ksign — `ksign://addsource?url=...`
- GBox — `gbox://AddSource/...`
- KravaSigner — `kravasigner://addRepo=...`

Install URL actions are exposed only where a documented implementation supports them:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

The editable registry is at `src/resources/url_handlers.json`. The web UI mirrors the same list in `web/js/app.js`.

## Release Notes

After each successful iOS build Action, the release notes are updated with the available source URL schemes and IPA URL schemes.

## Local build with Theos SDKs

The SDK collection is expected at `$THEOS_SDKS` or `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

The local script lets you select the device SDK version and deployment target. It produces an ad-hoc IPA by default; use your own signing identity with `--sign` when appropriate.

## GitHub Actions

The IPA workflow is **manual only**. There is no push or pull-request trigger.

Go to:

**Actions → Build iOS IPAs (manual) → Run workflow**

The workflow:

1. Checks out this repository.
2. Checks out `theos/sdks`.
3. Finds every available `iPhoneOS*.sdk`.
4. Builds an arm64 IPA for each device SDK.
5. Creates or updates the GitHub Release and uploads the generated IPAs.
6. After a successful build, updates the release notes with source and IPA URL protocol information.

## GitHub Pages

The Pages workflow is also manual-only. It publishes the `web/` directory when you explicitly run the workflow.

Web interface: https://xiaozhang-qd.github.io/AltSource-Center/web

## Upstream references

The feature design was informed by:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

This repository is a clean-room implementation. Third-party names and URL schemes are referenced for compatibility; third-party branding/assets are not required by the implementation.

## Important limitation

This app is a **URL launcher/catalog**, not a signing engine. Tapping Get or Add Source invokes the selected client's URL scheme (or opens the hosted IPA). The actual signing/install behavior belongs to that client.

## License

MIT.
