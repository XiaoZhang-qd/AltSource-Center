#ifndef ASC_LOCALE_H
#define ASC_LOCALE_H

typedef enum { ASC_LANG_ZH_HANS, ASC_LANG_ZH_HANT, ASC_LANG_EN, ASC_LANG_JA, ASC_LANG_VI, ASC_LANG_RU } ASCLanguage;
const char *asc_language_code(ASCLanguage language);
const char *asc_language_name(ASCLanguage language);
ASCLanguage asc_language_from_code(const char *code);
const char *asc_tr(const char *key, ASCLanguage language);

#endif
