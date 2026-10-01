<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · עברית

# AltSource Center

דפדפן AltSource מקומי מבוסס C11 עבור iPhone/iPad. הממשק ארוז בתוך ה-IPA עצמו ומתוכנן להרגיש יותר כמו קטלוג תוכנה בסגנון F-Droid: **מקורות ← אפליקציות ← פרטים ← קבל / הוסף מקור**.

## שינויים

מאגר זה משלב כעת את המעטפת המקורית של AltSource Center עם מודל האינטראקציה השימושי של AltDirect ו-AltSource Viewer:

- ספריית מקורות מקוממית.
- כפתור הוסף מקור ופרטי מקור.
- דף אפליקציות עם חיפוש.
- זרימת קבלה לכל אפליקציה.
- זרימת הוספת מקור נפרדת.
- דף לקוח URL עם רישום מטפלים ניתן לעריכה.
- English / 简体中文 / 繁體中文 ושפות ממשק נוספות.
- ייצוא/ייבוא מקוממי של ספריית המקורות.
- ה-IPA מכיל את החזית המלאה `web/`; אינו אתר אינטרנט מרוחק ארוז כקישור.
- ליבת C11 נותרה אחראית למודל המטפלים; iOS משתמש בגשר UIKit/WebKit קטן.
- דף הבית כולל כפתור להעתקת כתובת האינטרנט הנוכחית וקישור ל-GitHub Releases.

## תמיכה בפרוטוקולי URL

הפרויקט מונע על ידי תצורה במכוון. אין רשימה סמכותית יחידה של כל לקוחות AltSource תואמים, ותמיכה במקור אינה מרמזת על תמיכה בהתקנת IPA. סכמות URL עשויות להשתנות בין גרסאות לקוח.

מטפלי המקור הנוכחיים כוללים:

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

פעולות URL התקנה מוצגות רק כאשר יישום מתועד תומך בהן:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

הרישום הניתן לעריכה נמצא ב-`src/resources/url_handlers.json`. ממשק האינטרנט משקף את אותה רשימה ב-`web/js/app.js`.

## הערות גרסה

לאחר כל Action בניית iOS מוצלח, הערות הגרסה מתעדכנות עם סכמות URL המקור וה-IPA הזמינות.

## בנייה מקומית עם Theos SDKs

אוסף ה-SDK צפוי ב-`$THEOS_SDKS` או `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

הסקריפט המקומי מאפשר לך לבחור את גרסת SDK של המכשיר ויעד הפריסה. הוא מייצר IPA אד-הוק כברירת מחדל; השתמש בזהות החתימה שלך עם `--sign` בעת הצורך.

## GitHub Actions

זרימת עבודה של IPA היא **ידנית בלבד**. אין טריגר push או pull-request.

עבור אל:

**Actions ← Build iOS IPAs (manual) ← Run workflow**

זרימת העבודה:

1. מבצע checkout של מאגר זה.
2. מבצע checkout של `theos/sdks`.
3. מוצא כל `iPhoneOS*.sdk` זמין.
4. בונה IPA arm64 עבור כל SDK מכשיר.
5. יוצר או מעדכן את GitHub Release ומעלה את קבצי ה-IPA שנוצרו.
6. לאחר בנייה מוצלחת, מעדכן את הערות הגרסה עם מידע פרוטוקול URL של מקור ו-IPA.

## GitHub Pages

זרימת העבודה של Pages גם היא ידנית בלבד. היא מפרסמת את ספריית `web/` כאשר אתה מפעיל את זרימת העבודה באופן מפורש.

ממשק אינטרנט: https://xiaozhang-qd.github.io/AltSource-Center/web

## הפניות upstream

עיצוב התכונות הושפע מ:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

מאגר זה הוא יישום clean-room. שמות וסכמות URL של צד שלישי מופנים לצורכי תאימות; היישום אינו דורש מיתוג/נכסים של צד שלישי.

## מגבלה חשובה

אפליקציה זו היא **משגר/קטלוג URL**, לא מנוע חתימה. הקשה על קבל או הוסף מקור מפעילה את סכמת ה-URL של הלקוח שנבחר (או פותחת את ה-IPA המתארח). התנהגות החתימה/ההתקנה בפועל שייכת לאותו לקוח.

## רישיון

MIT.

## קישורים ישירים

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### ייבוא מקור מראה

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

### התקנת IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
