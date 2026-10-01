<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · Português · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Navegador AltSource local-first baseado em C11 para iPhone/iPad. A interface está embutida no próprio IPA e foi projetada para parecer mais com um catálogo de software no estilo F-Droid: **Fontes → Apps → Detalhes → Obter / Adicionar fonte**.

## Mudanças

Este repositório agora combina o shell nativo original do AltSource Center com o modelo de interação útil do AltDirect e do AltSource Viewer:

- Biblioteca de fontes local.
- Botão Adicionar Fonte e detalhes da fonte.
- Página de apps com pesquisa.
- Fluxo Obter por app.
- Fluxo Adicionar Fonte separado.
- Página de cliente URL com registro de manipuladores editável.
- English / 简体中文 / 繁體中文 e idiomas de interface adicionais.
- Exportação/importação local da biblioteca de fontes.
- O IPA contém o front-end `web/` completo; não é um site remoto empacotado como link.
- O núcleo C11 permanece responsável pelo modelo de manipuladores; o iOS usa uma pequena ponte UIKit/WebKit.
- A página inicial inclui um botão para copiar o URL Web atual e um link para o GitHub Releases.

## Suporte a protocolos URL

O projeto é deliberadamente orientado por configuração. Não existe uma lista autoritativa única de todos os clientes compatíveis com AltSource, e suporte de fonte não implica suporte a instalação de IPA. Esquemas URL podem mudar entre versões de clientes.

Os manipuladores de fonte atuais incluem:

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

Ações de URL de instalação são expostas apenas onde uma implementação documentada as suporta:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

O registro editável está em `src/resources/url_handlers.json`. A interface web espelha a mesma lista em `web/js/app.js`.

## Notas de versão

Após cada Action de build iOS bem-sucedida, as notas de versão são atualizadas com os esquemas URL de fonte e IPA disponíveis.

## Build local com Theos SDKs

A coleção de SDKs é esperada em `$THEOS_SDKS` ou `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

O script local permite selecionar a versão do SDK do dispositivo e o alvo de implantação. Produz um IPA ad-hoc por padrão; use sua própria identidade de assinatura com `--sign` quando apropriado.

## GitHub Actions

O workflow de IPA é **apenas manual**. Não há trigger de push ou pull-request.

Vá para:

**Actions → Build iOS IPAs (manual) → Run workflow**

O workflow:

1. Faz checkout deste repositório.
2. Faz checkout de `theos/sdks`.
3. Encontra todos os `iPhoneOS*.sdk` disponíveis.
4. Compila um IPA arm64 para cada SDK de dispositivo.
5. Cria ou atualiza o GitHub Release e faz upload dos IPAs gerados.
6. Após um build bem-sucedido, atualiza as notas de versão com informações de protocolo URL de fonte e IPA.

## GitHub Pages

O workflow de Pages também é apenas manual. Ele publica o diretório `web/` quando você executa o workflow explicitamente.

Interface web: https://xiaozhang-qd.github.io/AltSource-Center/web

## Referências upstream

O design de recursos foi informado por:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

Este repositório é uma implementação clean-room. Nomes e esquemas URL de terceiros são referenciados para compatibilidade; a implementação não requer branding/assets de terceiros.

## Limitação importante

Este app é um **lançador/catálogo de URL**, não um motor de assinatura. Tocar em Obter ou Adicionar Fonte invoca o esquema URL do cliente selecionado (ou abre o IPA hospedado). O comportamento real de assinatura/instalação pertence a esse cliente.

## Licença

MIT.

## Links diretos

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Importação de fonte mirror

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

### Instalação de IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
