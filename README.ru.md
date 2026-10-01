<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · Русский · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Локальный AltSource-браузер на базе C11 для iPhone/iPad. Интерфейс встроен в сам IPA и разработан, чтобы больше напоминать каталог ПО в стиле F-Droid: **Источники → Приложения → Детали → Получить / Добавить источник**.

## Изменения

Этот репозиторий теперь объединяет оригинальную нативную оболочку AltSource Center с полезной моделью взаимодействия AltDirect и AltSource Viewer:

- Локальная библиотека источников.
- Кнопка «Добавить источник» и детали источника.
- Страница приложений с поиском.
- Поток «Получить» для каждого приложения.
- Отдельный поток «Добавить источник».
- Страница URL-клиента с редактируемым реестром обработчиков.
- English / 简体中文 / 繁體中文 и дополнительные языки интерфейса.
- Локальный экспорт/импорт библиотеки источников.
- IPA содержит полный фронтенд `web/`; это не упакованная как ссылка удалённая веб-страница.
- Ядро C11 остаётся ответственным за модель обработчиков; iOS использует небольшой мост UIKit/WebKit.
- Главная страница включает кнопку копирования текущего веб-URL и ссылку на GitHub Releases.

## Поддержка URL-протоколов

Проект намеренно управляется конфигурацией. Не существует единого авторитетного списка всех AltSource-совместимых клиентов, и поддержка источников не означает поддержку установки IPA. URL-схемы могут меняться между версиями клиентов.

Текущие обработчики источников:

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

Действия URL установки предоставляются только там, где задокументированная реализация их поддерживает:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

Редактируемый реестр находится в `src/resources/url_handlers.json`. Веб-интерфейс отражает тот же список в `web/js/app.js`.

## Примечания к релизу

После каждого успешного Action сборки iOS примечания к релизу обновляются доступными URL-схемами источников и IPA.

## Локальная сборка с Theos SDK

Коллекция SDK ожидается в `$THEOS_SDKS` или `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

Локальный скрипт позволяет выбрать версию SDK устройства и цель развёртывания. По умолчанию создаётся ad-hoc IPA; используйте свой собственный идентификатор подписи с `--sign`, когда это уместно.

## GitHub Actions

Рабочий процесс IPA **только ручной**. Триггеров push или pull-request нет.

Перейдите к:

**Actions → Build iOS IPAs (manual) → Run workflow**

Рабочий процесс:

1. Клонирует этот репозиторий.
2. Клонирует `theos/sdks`.
3. Находит все доступные `iPhoneOS*.sdk`.
4. Собирает arm64 IPA для каждого SDK устройства.
5. Создаёт или обновляет GitHub Release и загружает сгенерированные IPA.
6. После успешной сборки обновляет примечания к релизу информацией об URL-протоколах источников и IPA.

## GitHub Pages

Рабочий процесс Pages также только ручной. Он публикует каталог `web/` при явном запуске рабочего процесса.

Веб-интерфейс: https://xiaozhang-qd.github.io/AltSource-Center/web

## Upstream-ссылки

Дизайн функций основывался на:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

Этот репозиторий — реализация clean-room. Сторонние названия и URL-схемы указаны для совместимости; реализация не требует стороннего брендинга/ресурсов.

## Важное ограничение

Это приложение — **URL-лаунчер/каталог**, а не движок подписи. Нажатие «Получить» или «Добавить источник» вызывает URL-схему выбранного клиента (или открывает размещённый IPA). Фактическое поведение подписи/установки принадлежит этому клиенту.

## Лицензия

MIT.

## Прямые ссылки

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Импорт зеркального источника

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

### Установка IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
