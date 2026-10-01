<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · Deutsch · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Ein C11-basierter, local-first AltSource-Browser für iPhone/iPad. Die Benutzeroberfläche ist vollständig im IPA enthalten und soll sich eher wie ein Softwarekatalog im Stil von F-Droid anfühlen: **Quellen → Apps → Details → Abrufen / Quelle hinzufügen**.

## Änderungen

Dieses Repository kombiniert nun die ursprüngliche AltSource Center Native-Shell mit dem nützlichen Interaktionsmodell von AltDirect und AltSource Viewer:

- Lokale Quellenbibliothek.
- Schaltfläche Quelle hinzufügen und Quellendetails.
- App-Seite mit Suche.
- Abruf-Fluss pro App.
- Separater Fluss zum Hinzufügen von Quellen.
- URL-Client-Seite mit bearbeitbarer Handler-Registry.
- English / 简体中文 / 繁體中文 und weitere UI-Sprachen.
- Lokaler Export/Import der Quellenbibliothek.
- Das IPA enthält das komplette `web/`-Front-End; es ist nicht als Link verpackte Remote-Website.
- Der C11-Kern bleibt für das Handler-Modell verantwortlich; iOS verwendet eine kleine UIKit/WebKit-Brücke.
- Die Startseite enthält eine Schaltfläche zum Kopieren der aktuellen Web-URL und einen Link zu GitHub Releases.

## URL-Protokoll-Unterstützung

Das Projekt ist bewusst konfigurationsgesteuert. Es gibt keine einzige autoritative Liste aller AltSource-kompatiblen Clients, und Quell-Support bedeutet nicht IPA-Installations-Support. URL-Schemata können sich zwischen Client-Versionen ändern.

Aktuelle Quellen-Handler:

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

Installations-URL-Aktionen werden nur bereitgestellt, wo eine dokumentierte Implementierung sie unterstützt:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

Die bearbeitbare Registry befindet sich in `src/resources/url_handlers.json`. Die Web-Oberfläche spiegelt dieselbe Liste in `web/js/app.js`.

## Release Notes

Nach jeder erfolgreichen iOS-Build-Action werden die Release Notes mit den verfügbaren Quellen- und IPA-URL-Schemata aktualisiert.

## Lokaler Build mit Theos SDKs

Die SDK-Sammlung wird unter `$THEOS_SDKS` oder `$HOME/theos/sdks` erwartet.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

Das lokale Skript ermöglicht die Auswahl der Geräte-SDK-Version und des Deployment-Targets. Es erstellt standardmäßig ein Ad-hoc-IPA; verwenden Sie Ihre eigene Signaturidentität mit `--sign`, wenn angemessen.

## GitHub Actions

Der IPA-Workflow ist **nur manuell**. Es gibt keinen Push- oder Pull-Request-Trigger.

Gehen Sie zu:

**Actions → Build iOS IPAs (manual) → Run workflow**

Der Workflow:

1. Checkt dieses Repository aus.
2. Checkt `theos/sdks` aus.
3. Findet alle verfügbaren `iPhoneOS*.sdk`.
4. Erstellt ein arm64-IPA für jedes Geräte-SDK.
5. Erstellt oder aktualisiert das GitHub-Release und lädt die generierten IPAs hoch.
6. Nach einem erfolgreichen Build werden die Release Notes mit Quellen- und IPA-URL-Protokollinformationen aktualisiert.

## GitHub Pages

Der Pages-Workflow ist ebenfalls nur manuell. Er veröffentlicht das `web/`-Verzeichnis, wenn Sie den Workflow explizit ausführen.

Web-Oberfläche: https://xiaozhang-qd.github.io/AltSource-Center/web

## Upstream-Referenzen

Das Feature-Design wurde beeinflusst von:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

Dieses Repository ist eine Clean-Room-Implementierung. Drittanbieter-Namen und URL-Schemata werden als Kompatibilitätsreferenz verwendet; Drittanbieter-Branding/Assets werden von der Implementierung nicht benötigt.

## Wichtige Einschränkung

Diese App ist ein **URL-Starter/Katalog**, keine Signatur-Engine. Das Antippen von Abrufen oder Quelle hinzufügen ruft das URL-Schema des ausgewählten Clients auf (oder öffnet das gehostete IPA). Das tatsächliche Signatur-/Installationsverhalten obliegt diesem Client.

## Lizenz

MIT.

## Direktlinks

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Mirror-Quelle importieren

- [AltStore Classic](altstore-classic://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [SideStore](sidestore://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [Feather](feather://source/https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [LiveContainer](livecontainer://sources?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [StikStore](stikstore://add-source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [TrollApps](trollapps://add?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [FlareStore](flarestore://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [ESign](esign://addsource?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [Ksign](ksign://addsource?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [GBox](gbox://AddSource/https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [KravaSigner](kravasigner://addRepo=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)

### IPA-Installation

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
