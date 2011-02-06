
#include <glib.h>
#include <stdio.h>
#include <string.h>

#include <fst.h>

typedef struct PluginParserState {
	gsize chunk_size;
	gsize chunk_pos;
	gint  base64_state;
	guint base64_save;
	guchar  *chunk_data;
	FST *fst;
} PluginParserState;

PluginParserState *pstate_new( FST *fst ) {
	PluginParserState *retval = g_malloc0( sizeof( PluginParserState ) );
	retval->fst = fst;
	return retval;
}

void g_markup_collect_attr( const gchar *element_name, 
		     const gchar        **attribute_names, 
		     const gchar        **attribute_values, 
		     GError             **error,
		     const gchar	*attr_name,
		     const gchar	**dst ) 
{
	int i;
	for (i = 0; attribute_names[i]; i++) {
		if( strcmp( attribute_names[i], attr_name ) )
			continue;

		*dst = attribute_values[i];
		return;
	}

	// If we are here we didnt find it.
	g_set_error (error, G_MARKUP_ERROR,
		     G_MARKUP_ERROR_INVALID_CONTENT,
		     "element '%s' requires attribute '%s'",
		     element_name, attr_name);
}



void start_check (   const gchar	* element_name,
		     const gchar        **attribute_names, 
		     const gchar        **attribute_values, 
		     PluginParserState  *pstate, 
		     GError             **error)
{
	const gchar *field_string;
	const gchar *val_string;
	char testString[64];
	int success;
	FST *fst = pstate->fst;


	g_markup_collect_attr( element_name, attribute_names, attribute_values, error, "field", &field_string );
	if( *error != NULL )
		return;

	g_markup_collect_attr( element_name, attribute_names, attribute_values, error, "value", &val_string );
	if( *error != NULL )
		return;


	printf( "got check %s = %s\n", field_string, val_string );

	if( strcmp( field_string, "productString" ) == 0 ) {
		success = fst_call_dispatcher( fst, effGetProductString, 0, 0, testString, 0 );
	}
	else if( strcmp( field_string, "effectName" ) == 0 ) {
		success = fst_call_dispatcher( fst, effGetEffectName, 0, 0, testString, 0 );
	}
	else if( strcmp( field_string, "vendorString" ) == 0 ) {
		success = fst_call_dispatcher( fst, effGetVendorString, 0, 0, testString, 0 );
	}

	if (success == 1) {
		if (strcmp (testString, val_string) != 0) {
			g_set_error (error, G_MARKUP_ERROR,
					G_MARKUP_ERROR_INVALID_CONTENT,
					"file is for another plugin" );
			printf ("string mismatch! Plugin has: %s\n", testString);
			return;
		}
	} else {
		g_set_error (error, G_MARKUP_ERROR,
				G_MARKUP_ERROR_INVALID_CONTENT,
				"file is for another plugin" );
		printf ("string mismatch! Plugin has none.\n");
		return;
	}

}

void start_param (   const gchar	* element_name,
		     const gchar        **attribute_names, 
		     const gchar        **attribute_values, 
		     PluginParserState  *pstate, 
		     GError             **error)
{
	const gchar *index_string;
	const gchar *val_string;
	int index;
	float val;
	FST *fst = pstate->fst;

	if( fst->plugin->flags & 32 )
		return;

	g_markup_collect_attr( element_name, attribute_names, attribute_values, error, "index", &index_string );
	if( *error != NULL )
		return;

	g_markup_collect_attr( element_name, attribute_names, attribute_values, error, "value", &val_string );
	if( *error != NULL )
		return;

	index = (int) g_ascii_strtoull( index_string, NULL, 10 );
	val = (float) g_ascii_strtod( val_string, NULL );

	pthread_mutex_lock( &fst->lock );
	fst->plugin->setParameter( fst->plugin, index, val );
	pthread_mutex_unlock( &fst->lock );
}

void start_chunk (   const gchar	* element_name,
		     const gchar        **attribute_names, 
		     const gchar        **attribute_values, 
		     PluginParserState  *pstate, 
		     GError             **error)
{
	const gchar *size_string;
	FST *fst = pstate->fst;

	if( ! (fst->plugin->flags & 32) ) {

		return;
	}
	g_markup_collect_attr( element_name, attribute_names, attribute_values, error, "size", &size_string );

	if( *error != NULL )
		return;

	pstate->chunk_size = g_ascii_strtoull( size_string, NULL, 10 );
	if( pstate->chunk_size == 0 ) {
		// TODO: set error.
		g_set_error (error, G_MARKUP_ERROR,
				G_MARKUP_ERROR_INVALID_CONTENT,
				"chunk size is 0 or invalid" );
		return;
	}

	pstate->chunk_data = g_malloc0( pstate->chunk_size );
	if( pstate->chunk_data == NULL ) {
		g_set_error (error, G_MARKUP_ERROR,
				G_MARKUP_ERROR_INVALID_CONTENT,
				"cant allocate memory" );
		return;
	}

	pstate->base64_state = 0;
	pstate->base64_save = 0;
}

void end_chunk(         PluginParserState             *pstate,
                        GError             **error)
{
	// Set Chunk to plug here.
	FST *fst = pstate->fst;
	fst_call_dispatcher( fst, 24, 0, pstate->chunk_size, pstate->chunk_data, 0 );
	
	g_free( pstate->chunk_data );
	pstate->chunk_data = NULL;
	pstate->chunk_size = 0;

}

void start_element (GMarkupParseContext *context, 
		     const gchar         *element_name, 
		     const gchar        **attribute_names, 
		     const gchar        **attribute_values, 
		     gpointer		user_data, 
		     GError             **error)
{
	PluginParserState *pstate = (PluginParserState *) user_data;

	if( strcmp( element_name, "chunk" ) == 0 ) {
		start_chunk( element_name, attribute_names, attribute_values, pstate, error );
	}
	if( strcmp( element_name, "check" ) == 0 ) {
		start_check( element_name, attribute_names, attribute_values, pstate, error );
	}
	if( strcmp( element_name, "param" ) == 0 ) {
		start_param( element_name, attribute_names, attribute_values, pstate, error );
	}
}

  /* Called for close tags </foo> */
void end_element    (GMarkupParseContext *context,
                        const gchar         *element_name,
                        gpointer             user_data,
                        GError             **error)
{
	if( strcmp( element_name, "chunk" )==0 ) {
		end_chunk( user_data, error );
	}
}

  /* Called for character data */
  /* text is not nul-terminated */
void mytext           (GMarkupParseContext *context,
                        const gchar         *text,
                        gsize                text_len,  
                        gpointer	     user_data,
                        GError             **error)
{
	PluginParserState *pstate = (PluginParserState *) user_data;
	if( strcmp( g_markup_parse_context_get_element( context ), "chunk" ) == 0 ) 
	{
		gsize num_bytes = g_base64_decode_step( text, text_len, pstate->chunk_data + pstate->chunk_pos, &pstate->base64_state, &pstate->base64_save );
		pstate->chunk_pos += num_bytes;
	}
}

#define BUFFER_SIZE 256

int fst_load_state( FST *fst, char *filename ) 
{
	char buf[BUFFER_SIZE];
	int i;
	GError *err = NULL;

	GIOChannel *chan = g_io_channel_new_file( filename, "r", &err );

	GMarkupParser parser = { NULL, NULL, NULL, NULL, NULL };
	parser.start_element = start_element;
	parser.end_element = end_element;
	parser.text = mytext;

	PluginParserState *pstate = pstate_new( fst );


	GMarkupParseContext *context = g_markup_parse_context_new( &parser, 0, pstate, NULL );

	while(1) {
		gsize bytes;
		GIOStatus status = g_io_channel_read_chars( chan, buf, BUFFER_SIZE, &bytes, &err );
		if( status == G_IO_STATUS_ERROR )
			break;
		if( status == G_IO_STATUS_EOF )
			break;

		g_markup_parse_context_parse( context, buf, bytes, &err );
		if( err != NULL )
			break;
	}

	if( err != NULL )
		g_markup_parse_context_end_parse( context, &err ); 
	g_markup_parse_context_free( context );
	if( err != NULL )
		return 0;

	return 1;
}

