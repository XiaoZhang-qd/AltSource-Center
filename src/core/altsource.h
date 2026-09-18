#ifndef ASC_ALTSOURCE_H
#define ASC_ALTSOURCE_H
#include <stddef.h>
typedef struct {
 char name[256], identifier[256], developer[256], version[64], version_date[64];
 char description[4096], icon_url[1024], download_url[2048], source_url[2048];
} ASCApp;
typedef struct {
 char name[256], identifier[256], subtitle[512], description[4096];
 char icon_url[1024], source_url[2048];
 size_t app_count;
} ASCSource;
void asc_source_init(ASCSource *source);
void asc_app_init(ASCApp *app);
#endif
