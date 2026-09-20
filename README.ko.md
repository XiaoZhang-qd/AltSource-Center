<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · 한국어 · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

C11과 로컬 우선을 기반으로 한 iPhone/iPad용 AltSource 브라우저입니다. UI는 IPA 자체에 포함되며 F-Droid와 비슷한 소프트웨어 카탈로그를 지향합니다: **소스 → 앱 → 상세 정보 → 받기 / 소스 추가**.

## 변경 사항

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

## URL 프로토콜 지원

프로젝트는 설정 기반으로 동작합니다. 모든 AltSource 호환 클라이언트를 포함하는 단일 공식 목록은 없으며 소스 추가 지원이 IPA 설치 지원을 의미하지 않습니다. URL 스킴은 클라이언트 버전에 따라 변경될 수 있습니다.

현재 소스 핸들러:

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

문서화된 구현에서 지원하는 경우에만 IPA 설치 URL 작업을 제공합니다:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

The editable registry is at `src/resources/url_handlers.json`. The web UI mirrors the same list in `web/js/app.js`.

## Release Notes

iOS 빌드 Action이 성공할 때마다 사용 가능한 소스 URL 스킴과 IPA URL 스킴이 Release Notes에 자동으로 추가됩니다.

## Theos SDK를 사용한 로컬 빌드

The SDK collection is expected at `$THEOS_SDKS` or `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

The local script lets you select the device SDK version and deployment target. It produces an ad-hoc IPA by default; use your own signing identity with `--sign` when appropriate.

## GitHub Actions

IPA 워크플로는 **수동 실행만** 지원합니다. push 또는 pull-request 트리거는 없습니다.

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

Pages 워크플로도 수동 실행만 지원합니다. 명시적으로 실행하면 `web/` 디렉터리를 게시합니다.

Web 인터페이스: https://xiaozhang-qd.github.io/AltSource-Center/web

## 업스트림 참고

기능 설계는 다음 프로젝트를 참고했습니다:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

This repository is a clean-room implementation. Third-party names and URL schemes are referenced for compatibility; third-party branding/assets are not required by the implementation.

## 중요한 제한

이 앱은 **URL 실행기/카탈로그**이며 서명 엔진이 아닙니다. 받기 또는 소스 추가를 누르면 선택한 클라이언트의 URL 스킴을 호출하거나 호스팅된 IPA를 엽니다. 실제 서명/설치는 해당 클라이언트가 담당합니다.

## 라이선스

MIT.

## 직접 링크

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/source.json

### 미러 소스 가져오기

- [AltStore Classic](altstore-classic://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [SideStore](sidestore://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [Feather](feather://source/https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [LiveContainer](livecontainer://sources?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [StikStore](stikstore://add-source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [TrollApps](trollapps://add?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [FlareStore](flarestore://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [ESign](esign://addsource?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [Ksign](ksign://addsource?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [GBox](gbox://AddSource/https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)
- [KravaSigner](kravasigner://addRepo=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fsource.json)

### IPA 설치

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
