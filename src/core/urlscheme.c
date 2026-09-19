#include "urlscheme.h"
#include <string.h>
#include <ctype.h>
static const ASCURLHandler H[]={
{"altstore","AltStore Classic","altstore-classic://source?url=%URL%","altstore://install?url=%URL%",true},
{"sidestore","SideStore","sidestore://source?url=%URL%","sidestore://install?url=%URL%",true},
{"feather","Feather","feather://source/%URL%","feather://install/%URL%",true},
{"livecontainer","LiveContainer","livecontainer://sources?url=%URL%","",true},
{"stikstore","StikStore","stikstore://add-source?url=%URL%","",true},
{"trollapps","TrollApps","trollapps://add?url=%URL%","",true},
{"flarestore","FlareStore","flarestore://source?url=%URL%","",true},
{"esign","ESign","esign://addsource?url=%URL%","esign://install?url=%URL%",true},
{"ksign","Ksign","ksign://addsource?url=%URL%","ksign://install?url=%URL%",true},
{"gbox","GBox","gbox://AddSource/%URL%","",true},
{"kravasigner","KravaSigner","kravasigner://addRepo=%URL%","",true}};
size_t asc_default_handlers(ASCURLHandler*out,size_t cap){size_t n=sizeof(H)/sizeof(H[0]);if(out&&cap){if(n>cap)n=cap;memcpy(out,H,n*sizeof(*out));}return sizeof(H)/sizeof(H[0]);}
bool asc_expand_template(const char*t,const char*v,char*o,size_t z){if(!t||!v||!o||!z)return false;const char*p=strstr(t,"%URL%");if(!p)return false;size_t a=(size_t)(p-t),b=strlen(p+5),c=strlen(v);if(a+c+b+1>z)return false;memcpy(o,t,a);memcpy(o+a,v,c);memcpy(o+a+c,p+5,b+1);return true;}
bool asc_is_safe_handler_url(const char*u){if(!u)return false;const char*c=strchr(u,':');if(!c||c==u)return false;for(const char*p=u;p<c;p++)if(!isalnum((unsigned char)*p)&&*p!='+'&&*p!='-'&&*p!='.')return false;return true;}
const char*asc_core_version(void){return "2.0";}