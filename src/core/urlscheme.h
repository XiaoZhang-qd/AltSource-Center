#ifndef ASC_URLSCHEME_H
#define ASC_URLSCHEME_H
#include <stddef.h>
#include <stdbool.h>
typedef struct {
 char id[64], name[128], source_template[512], install_template[512];
 bool enabled;
} ASCURLHandler;
size_t asc_default_handlers(ASCURLHandler *out,size_t capacity);
bool asc_expand_template(const char *template_url,const char *value,char *out,size_t out_size);
bool asc_is_safe_handler_url(const char *url);
#endif
