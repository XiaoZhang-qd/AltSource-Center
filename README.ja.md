<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · 日本語 · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

C11 とローカル優先で設計された iPhone/iPad 向け AltSource ブラウザーです。UI は IPA に完全に同梱され、F-Droid のようなソフトウェアカタログを目指しています：**ソース → アプリ → 詳細 → 取得 / ソース追加**。

## 変更内容

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

## URL プロトコル対応

本プロジェクトは設定駆動です。すべての AltSource 対応クライアントを網羅する唯一の公式リストはなく、ソース追加に対応していても IPA インストールに対応するとは限りません。URL スキームはクライアントのバージョンによって変わる場合があります。

現在のソースハンドラー：

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

文書化された実装が対応している場合のみ IPA インストール URL 操作を提供します：

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

The editable registry is at `src/resources/url_handlers.json`. The web UI mirrors the same list in `web/js/app.js`.

## Release Notes

iOS ビルド Action が成功するたびに、利用可能なソース URL スキームと IPA URL スキームが Release Notes に自動追加されます。

## Theos SDK によるローカルビルド

The SDK collection is expected at `$THEOS_SDKS` or `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

The local script lets you select the device SDK version and deployment target. It produces an ad-hoc IPA by default; use your own signing identity with `--sign` when appropriate.

## GitHub Actions

IPA ワークフローは**手動のみ**です。push や pull-request トリガーはありません。

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

Pages ワークフローも手動のみです。明示的に実行すると `web/` ディレクトリを公開します。

Web インターフェース：https://xiaozhang-qd.github.io/AltSource-Center/web

## 上流プロジェクト

機能設計は以下を参考にしています：

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

This repository is a clean-room implementation. Third-party names and URL schemes are referenced for compatibility; third-party branding/assets are not required by the implementation.

## 重要な制限

このアプリは **URL ランチャー/カタログ** であり、署名エンジンではありません。取得またはソース追加をタップすると、選択したクライアントの URL スキームを呼び出します（またはホストされた IPA を開きます）。実際の署名・インストールはそのクライアントが担当します。

## ライセンス

MIT.

## 直接リンク

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/source.json

### ミラーソースのインポート

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

### IPA インストール

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
