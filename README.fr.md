<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · Français · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Navigateur AltSource local-first basé sur C11 pour iPhone/iPad. L'interface est intégrée dans l'IPA lui-même et est conçue pour ressembler davantage à un catalogue de logiciels de style F-Droid : **Sources → Applications → Détails → Obtenir / Ajouter une source**.

## Modifications

Ce dépôt combine désormais le shell natif original d'AltSource Center avec le modèle d'interaction utile d'AltDirect et d'AltSource Viewer :

- Bibliothèque de sources locale.
- Bouton Ajouter une source et détails de la source.
- Page d'applications avec recherche.
- Flux Obtenir par application.
- Flux Ajouter une source distinct.
- Page client-URL avec registre de gestionnaires modifiable.
- English / 简体中文 / 繁體中文 et langues d'interface supplémentaires.
- Export/import local de la bibliothèque de sources.
- L'IPA contient le front-end `web/` complet ; il ne s'agit pas d'un site web distant empaqueté en lien.
- Le cœur C11 reste responsable du modèle de gestionnaires ; iOS utilise un petit pont UIKit/WebKit.
- La page d'accueil inclut un bouton pour copier l'URL Web actuelle et un lien vers GitHub Releases.

## Prise en charge des protocoles URL

Le projet est délibérément piloté par configuration. Il n'existe pas de liste officielle unique de tous les clients compatibles AltSource, et la prise en charge des sources n'implique pas la prise en charge de l'installation IPA. Les schémas URL peuvent changer entre les versions de clients.

Les gestionnaires de source actuels incluent :

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

Les actions d'URL d'installation sont exposées uniquement lorsqu'une implémentation documentée les prend en charge :

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

Le registre modifiable se trouve dans `src/resources/url_handlers.json`. L'interface web reflète la même liste dans `web/js/app.js`.

## Notes de version

Après chaque Action de build iOS réussie, les notes de version sont mises à jour avec les schémas URL de source et d'IPA disponibles.

## Build local avec les SDK Theos

La collection de SDK est attendue à `$THEOS_SDKS` ou `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

Le script local permet de sélectionner la version du SDK de l'appareil et la cible de déploiement. Il produit un IPA ad-hoc par défaut ; utilisez votre propre identité de signature avec `--sign` lorsque c'est approprié.

## GitHub Actions

Le workflow IPA est **manuel uniquement**. Il n'y a pas de trigger de push ou de pull-request.

Allez à :

**Actions → Build iOS IPAs (manual) → Run workflow**

Le workflow :

1. Clone ce dépôt.
2. Clone `theos/sdks`.
3. Trouve tous les `iPhoneOS*.sdk` disponibles.
4. Compile un IPA arm64 pour chaque SDK d'appareil.
5. Crée ou met à jour le GitHub Release et téléverse les IPA générés.
6. Après un build réussi, met à jour les notes de version avec les informations de protocole URL de source et d'IPA.

## GitHub Pages

Le workflow Pages est également manuel uniquement. Il publie le répertoire `web/` lorsque vous exécutez explicitement le workflow.

Interface web : https://xiaozhang-qd.github.io/AltSource-Center/web

## Références upstream

La conception des fonctionnalités s'est inspirée de :

- AltDirect : https://github.com/StikDebug/altdirect
- AltSource Viewer : https://github.com/therealFoxster/altsource-viewer
- Theos SDKs : https://github.com/theos/sdks

Ce dépôt est une implémentation clean-room. Les noms et schémas URL tiers sont référencés pour la compatibilité ; l'implémentation ne nécessite pas de branding/assets tiers.

## Limitation importante

Cette application est un **lanceur/catalogue d'URL**, pas un moteur de signature. Appuyer sur Obtenir ou Ajouter une source invoque le schéma URL du client sélectionné (ou ouvre l'IPA hébergé). Le comportement réel de signature/installation appartient à ce client.

## Licence

MIT.

## Liens directs

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Importation de source miroir

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

### Installation IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
