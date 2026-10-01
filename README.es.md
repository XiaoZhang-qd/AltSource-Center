<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · Español · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Navegador AltSource local-first basado en C11 para iPhone/iPad. La interfaz está incluida en el propio IPA y está diseñada para parecerse más a un catálogo de software estilo F-Droid: **Fuentes → Apps → Detalles → Obtener / Añadir fuente**.

## Cambios

Este repositorio ahora combina el shell nativo original de AltSource Center con el útil modelo de interacción de AltDirect y AltSource Viewer:

- Biblioteca de fuentes local.
- Botón Añadir fuente y detalles de la fuente.
- Página de apps con búsqueda.
- Flujo Obtener por cada app.
- Flujo Añadir fuente independiente.
- Página de clientes URL con registro de manejadores editable.
- English / 简体中文 / 繁體中文 y idiomas de interfaz adicionales.
- Exportación/importación local de la biblioteca de fuentes.
- El IPA contiene el front-end `web/` completo; no es un sitio web remoto empaquetado como enlace.
- El núcleo C11 sigue siendo responsable del modelo de manejadores; iOS usa un pequeño puente UIKit/WebKit.
- La página principal incluye un botón para copiar la URL Web actual y un enlace a GitHub Releases.

## Soporte de protocolos URL

El proyecto es deliberadamente basado en configuración. No existe una lista autoritativa única de todos los clientes compatibles con AltSource, y el soporte de fuente no implica soporte de instalación IPA. Los esquemas URL pueden cambiar entre versiones de clientes.

Los manejadores de fuente actuales incluyen:

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

Las acciones de URL de instalación se exponen solo donde una implementación documentada las admite:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

El registro editable está en `src/resources/url_handlers.json`. La interfaz web refleja la misma lista en `web/js/app.js`.

## Notas de versión

Después de cada compilación iOS exitosa, las notas de versión se actualizan con los esquemas URL de fuente e IPA disponibles.

## Compilación local con Theos SDKs

Se espera que la colección de SDKs esté en `$THEOS_SDKS` o `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

El script local permite seleccionar la versión del SDK del dispositivo y el destino de despliegue. Produce un IPA ad-hoc por defecto; usa tu propia identidad de firma con `--sign` cuando sea apropiado.

## GitHub Actions

El flujo de trabajo IPA es **solo manual**. No hay trigger de push o pull-request.

Ir a:

**Actions → Build iOS IPAs (manual) → Run workflow**

El flujo de trabajo:

1. Descarga este repositorio.
2. Descarga `theos/sdks`.
3. Encuentra todos los `iPhoneOS*.sdk` disponibles.
4. Compila un IPA arm64 para cada SDK de dispositivo.
5. Crea o actualiza el GitHub Release y sube los IPA generados.
6. Tras una compilación exitosa, actualiza las notas de versión con la información de protocolos URL de fuente e IPA.

## GitHub Pages

El flujo de trabajo de Pages también es solo manual. Publica el directorio `web/` cuando ejecutas el flujo de trabajo explícitamente.

Interfaz web: https://xiaozhang-qd.github.io/AltSource-Center/web

## Referencias upstream

El diseño de funciones se basó en:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

Este repositorio es una implementación clean-room. Los nombres y esquemas URL de terceros se referencian para compatibilidad; la implementación no requiere branding/assets de terceros.

## Limitación importante

Esta app es un **lanzador/catálogo de URL**, no un motor de firma. Al pulsar Obtener o Añadir fuente se invoca el esquema URL del cliente seleccionado (o abre el IPA alojado). El comportamiento real de firma/instalación pertenece a ese cliente.

## Licencia

MIT.

## Enlaces directos

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Importación de fuente mirror

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

### Instalación de IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
