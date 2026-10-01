<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · [Tiếng Việt](README.vi.md) · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · العربية · [עברית](README.he.md)

# AltSource Center

متصفح AltSource محلي أولاً مبني على C11 لـ iPhone/iPad. الواجهة مضمّنة داخل IPA نفسه وصُممت لتشبه أكثر كتالوج برامج بنمط F-Droid: **المصادر ← التطبيقات ← التفاصيل ← الحصول على / إضافة مصدر**.

## التغييرات

يجمع هذا المستودع الآن الغلاف الأصلي لـ AltSource Center مع نموذج التفاعل المفيد من AltDirect و AltSource Viewer:

- مكتبة مصادر محلية.
- زر إضافة مصدر وتفاصيل المصدر.
- صفحة التطبيقات مع بحث.
- تدفق الحصول على لكل تطبيق.
- تدفق إضافة مصدر منفصل.
- صفحة عميل URL مع سجل معالجات قابل للتعديل.
- English / 简体中文 / 繁體中文 ولغات واجهة إضافية.
- تصدير/استيراد محلي لمكتبة المصادر.
- يحتوي IPA على واجهة `web/` الأمامية الكاملة؛ ليس موقع ويب بعيد مُغلَّف كرابط.
- يظل نواة C11 مسؤولة عن نموذج المعالجات؛ يستخدم iOS جسر UIKit/WebKit صغير.
- تتضمن الصفحة الرئيسية زر نسخ عنوان URL الحالي للويب ورابط إلى GitHub Releases.

## دعم بروتوكول URL

المشروع مدفوع بالتكوين عمداً. لا توجد قائمة موثوقة واحدة لكل عملاء AltSource المتوافقين، ودعم المصدر لا يعني دعم تثبيت IPA. قد تتغير مخططات URL بين إصدارات العملاء.

تشمل معالجات المصدر الحالية:

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

تُعرض إجراءات URL للتثبيت فقط حيث تدعمها تطبيق موثّق:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

السجل القابل للتعديل في `src/resources/url_handlers.json`. تعكس واجهة الويب نفس القائمة في `web/js/app.js`.

## ملاحظات الإصدار

بعد كل Action ناجح لبناء iOS، تُحدَّث ملاحظات الإصدار بمخططات URL للمصادر و IPA المتاحة.

## البناء المحلي مع Theos SDKs

يُتوقع وجود مجموعة SDK في `$THEOS_SDKS` أو `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

البرنامج النصي المحلي يتيح لك اختيار نسخة SDK للجهاز وهدف النشر. يُنتج IPA مخصص بشكل افتراضي؛ استخدم هوية التوقيع الخاصة بك مع `--sign` عند الحاجة.

## GitHub Actions

سير عمل IPA **يدوي فقط**. لا يوجد trigger للـ push أو pull-request.

اذهب إلى:

**Actions ← Build iOS IPAs (manual) ← Run workflow**

سير العمل:

1. يعمل نسخة من هذا المستودع.
2. يعمل نسخة من `theos/sdks`.
3. يجد كل `iPhoneOS*.sdk` المتاحة.
4. يبني IPA arm64 لكل SDK جهاز.
5. ينشئ أو يحدّث GitHub Release ويرفع ملفات IPA المُنشأة.
6. بعد بناء ناجح، يحدّث ملاحظات الإصدار بمعلومات بروتوكول URL للمصادر و IPA.

## GitHub Pages

سير عمل Pages يدوي فقط أيضاً. ينشر دليل `web/` عند تشغيلك سير العمل بشكل صريح.

واجهة الويب: https://xiaozhang-qd.github.io/AltSource-Center/web

## مراجع upstream

استُرشد تصميم الميزات بـ:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

هذا المستودع تنفيذ clean-room. تُشار إليه أسماء ومخططات URL لأطراف ثالث للتوافق؛ التنفيذ لا يتطلب علامات تجارية/أصول لأطراف ثالث.

## قيود مهم

هذا التطبيق **مُطلق/كتالوج URL**، وليس محرك توقيع. النقر على الحصول على أو إضافة مصدر يستدعي مخطط URL للعميل المحدد (أو يفتح IPA المستضاف). سلوك التوقيع/التثبيت الفعلي يخص ذلك العميل.

## الترخيص

MIT.

## روابط مباشرة

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### استيراد المصدر المرآة

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

### تثبيت IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
