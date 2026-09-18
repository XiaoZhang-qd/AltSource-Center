#include "locale.h"
#include <string.h>

typedef struct { const char *key,*hans,*hant,*en,*ja,*vi,*ru; } Entry;
static const Entry T[] = {
 {"home","首页","首頁","Home","ホーム","Trang chủ","Главная"},
 {"apps","应用","應用程式","Apps","アプリ","Ứng dụng","Приложения"},
 {"sources","源","來源","Sources","ソース","Nguồn","Источники"},
 {"settings","设置","設定","Settings","設定","Cài đặt","Настройки"},
 {"language","语言","語言","Language","言語","Ngôn ngữ","Язык"},
 {"search","搜索","搜尋","Search","検索","Tìm kiếm","Поиск"},
 {"add_source","添加源","加入來源","Add Source","ソースを追加","Thêm nguồn","Добавить источник"},
 {"get","获取","取得","Get","入手","Nhận","Получить"},
 {"description","描述","描述","Description","説明","Mô tả","Описание"},
 {"developer","开发者","開發者","Developer","開発者","Nhà phát triển","Разработчик"},
 {"version","版本","版本","Version","バージョン","Phiên bản","Версия"},
 {"about","关于","關於","About","このアプリについて","Giới thiệu","О приложении"}
};
const char *asc_language_code(ASCLanguage l){static const char *v[]={"zh-Hans","zh-Hant","en","ja","vi","ru"};return v[l<6?l:2];}
const char *asc_language_name(ASCLanguage l){static const char *v[]={"简体中文","繁體中文","English","日本語","Tiếng Việt","Русский"};return v[l<6?l:2];}
ASCLanguage asc_language_from_code(const char *c){if(!c)return ASC_LANG_ZH_HANS;if(!strcmp(c,"zh-Hant"))return ASC_LANG_ZH_HANT;if(!strcmp(c,"en"))return ASC_LANG_EN;if(!strcmp(c,"ja"))return ASC_LANG_JA;if(!strcmp(c,"vi"))return ASC_LANG_VI;if(!strcmp(c,"ru"))return ASC_LANG_RU;return ASC_LANG_ZH_HANS;}
const char *asc_tr(const char *key,ASCLanguage l){for(size_t i=0;i<sizeof(T)/sizeof(T[0]);i++)if(!strcmp(T[i].key,key)){const char *v[]={T[i].hans,T[i].hant,T[i].en,T[i].ja,T[i].vi,T[i].ru};return v[l<6?l:2];}return key;}
