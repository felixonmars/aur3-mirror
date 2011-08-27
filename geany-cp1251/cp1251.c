#include "geanyplugin.h"	/* plugin API, always comes first */
#include <stdio.h>
#include <string.h>

#define COLLECT_BUF_SIZE 1024
#define VERSION "0.1"

GeanyPlugin		*geany_plugin;
GeanyData		*geany_data;
GeanyFunctions	*geany_functions;

PLUGIN_VERSION_CHECK(147)
PLUGIN_SET_INFO(_("cp1251"), _("Auto detect cp1251 codepage"), VERSION, _("evgenyl"))

static void open_file(GObject *obj, GeanyDocument *doc, gpointer user_data) {
	int i, buf_size, c;
	int collect_buf[COLLECT_BUF_SIZE];
	float sym_counters[4];	
	FILE *f;	
	f=fopen(doc->real_path,"r");	
	if (f==NULL) return ;
	c = 0;
	for (buf_size = 0; (c = fgetc(f)) != EOF && buf_size < COLLECT_BUF_SIZE; ) if (c>127) collect_buf[buf_size++] = c;
	fclose(f);
	if (buf_size==0) return;
	sym_counters[0]=sym_counters[1]=sym_counters[2]=sym_counters[3]=0.0;	
	for ( i = 0; i < buf_size; i++ ) {
		if (collect_buf[i]==0xE5) sym_counters[0]+=1; //E
		if (collect_buf[i]==0xE0) sym_counters[1]+=1; //A
		if (collect_buf[i]==0xEE) sym_counters[2]+=1; //O
		if (collect_buf[i]==0xE8) sym_counters[3]+=1; //I
	}
	for ( i = 0; i < 4; i++ ) if (sym_counters[i]>0) sym_counters[i]=sym_counters[i]/buf_size*100;
	if ( (sym_counters[0]+sym_counters[1]+sym_counters[2]+sym_counters[3])>20 ) document_reload_file( doc, "CP1251");	
}

PluginCallback plugin_callbacks[] =
{
	{ "document-open", (GCallback) &open_file, FALSE, NULL },
	{ NULL, NULL, FALSE, NULL }
};

void plugin_init(GeanyData *data) {

}

void plugin_cleanup(void) {

}
