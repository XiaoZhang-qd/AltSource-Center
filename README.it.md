<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · Italiano · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Browser AltSource local-first basato su C11 per iPhone/iPad. L'interfaccia è inclusa nell'IPA stesso ed è progettata per sembrare più un catalogo di software in stile F-Droid: **Sorgenti → App → Dettagli → Ottieni / Aggiungi sorgente**.

## Modifiche

Questo repository ora combina la shell nativa originale di AltSource Center con il modello di interazione utile di AltDirect e AltSource Viewer:

- Libreria di sorgenti locale.
- Pulsante Aggiungi sorgente e dettagli della sorgente.
- Pagina delle app con ricerca.
- Flusso Ottieni per ogni app.
- Flusso Aggiungi sorgente separato.
- Pagina client-URL con registro gestori modificabile.
- English / 简体中文 / 繁體中文 e lingue di interf aggiuntive.
- Esportazione/importazione locale della libreria di sorgenti.
- L'IPA contiene il front-end `web/` completo; non è un sito web remoto impacchettato come link.
- Il core C11 rimane responsabile del modello di gestori; iOS usa un piccolo bridge UIKit/WebKit.
- La home page include un pulsante per copiare l'URL Web attuale e un link a GitHub Releases.

## Supporto protocolli URL

Il progetto è volutamente guidato dalla configurazione. Non esiste un'unica lista autorevole di tutti i client compatibili con AltSource, e il supporto delle sorgenti non implica il supporto all'installazione IPA. Gli schemi URL possono cambiare tra le versioni dei client.

I gestori di sorgente attuali includono:

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

Le azioni URL di installazione sono esposte solo dove un'implementazione documentata le supporta:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

Il registro modificabile si trova in `src/resources/url_handlers.json`. L'interfaccia web riflette la stessa lista in `web/js/app.js`.

## Note di rilascio

Dopo ogni Action di build iOS riuscita, le note di rilascio vengono aggiornate con gli schemi URL di sorgente e IPA disponibili.

## Build locale con Theos SDK

La collezione di SDK è attesa in `$THEOS_SDKS` o `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

Lo script locale permette di selezionare la versione del SDK del dispositivo e il target di deployment. Produce un IPA ad-hoc per default; usa la tua identità di firma con `--sign` quando appropriato.

## GitHub Actions

Il workflow IPA è **solo manuale**. Non c'è trigger di push o pull-request.

Vai a:

**Actions → Build iOS IPAs (manual) → Run workflow**

Il workflow:

1. Esegue il checkout di questo repository.
2. Esegue il checkout di `theos/sdks`.
3. Trova ogni `iPhoneOS*.sdk` disponibile.
4. Compila un IPA arm64 per ogni SDK del dispositivo.
5. Crea o aggiorna il GitHub Release e carica gli IPA generati.
6. Dopo un build riuscito, aggiorna le note di rilascio con le informazioni sui protocolli URL di sorgente e IPA.

## GitHub Pages

Anche il workflow Pages è solo manuale. Pubblica la directory `web/` quando esegui esplicitamente il workflow.

Interfaccia web: https://xiaozhang-qd.github.io/AltSource-Center/web

## Riferimenti upstream

Il design delle funzionalità si è ispirato a:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

Questo repository è un'implementazione clean-room. Nomi e schemi URL di terze parti sono referenziati per compatibilità; l'implementazione non richiede branding/asset di terze parti.

## Limitazione importante

Questa app è un **launcher/catalogo di URL**, non un motore di firma. Toccare Ottieni o Aggiungi sorgente richiama lo schema URL del client selezionato (o apre l'IPA ospitato). Il comportamento effettivo di firma/installazione appartiene a quel client.

## Licenza

MIT.

## Collegamenti diretti

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Importazione sorgente mirror

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

### Installazione IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
