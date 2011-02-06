

#include "jackvst.h"

#include <gtk/gtk.h>
#include <gdk/gdkx.h>
#include <gdk/gdkevents.h>
#include <X11/Xlib.h>

#include <glib-2.0/glib.h>

gboolean g_quit = FALSE;
gboolean quit = FALSE;

static	GtkWidget* window;
static	GtkWidget* gtk_socket;
static	GtkWidget* vpacker;
static	GtkWidget* hpacker;
static	GtkWidget* bypass_button;
static	GtkWidget* remove_button;
static	GtkWidget* mute_button;
static  GtkWidget* event_box;
static  GtkWidget* preset_listbox;
static	GtkWidget* midi_learn_toggle;
static	GtkWidget* load_button;
static	GtkWidget* save_button;


static void
learn_handler (GtkToggleButton *but, gboolean ptr)
{
	JackVST* jvst = (JackVST*) ptr;
	
	if( gtk_toggle_button_get_active (but) ) {
		jvst->midi_learn = 1;
		jvst->midi_learn_CC = -1;
		jvst->midi_learn_PARAM = -1;
	} else {
		jvst->midi_learn = 0;
	}
	gtk_widget_grab_focus( gtk_socket );
}

static void
bypass_handler (GtkToggleButton *but, gboolean ptr)
{
	JackVST* jvst = (JackVST*) ptr;
	
	jvst->bypassed = gtk_toggle_button_get_active (but);
	gtk_widget_grab_focus( gtk_socket );
}

static void
mute_handler (GtkToggleButton *but, gboolean ptr)
{
	JackVST* jvst = (JackVST*) ptr;
	jvst->muted = gtk_toggle_button_get_active (but);
	gtk_widget_grab_focus( gtk_socket );
}

static void
save_handler (GtkToggleButton *but, gboolean ptr)
{
 	int i, bytelen = 0;
	void *chunk;

	JackVST* jvst = (JackVST*) ptr;

	GtkWidget *dialog;
	dialog = gtk_file_chooser_dialog_new ("Save Plugin State",
			GTK_WINDOW (window),
			GTK_FILE_CHOOSER_ACTION_SAVE,
			GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
			GTK_STOCK_SAVE, GTK_RESPONSE_ACCEPT,
			NULL);

	GtkFileFilter * ff = gtk_file_filter_new();
	gtk_file_filter_set_name(ff,"FST Plugin State");
	gtk_file_filter_add_pattern(ff,"*.fps");
	gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog),ff);

	gtk_file_chooser_set_do_overwrite_confirmation (GTK_FILE_CHOOSER (dialog), TRUE);

	if (gtk_dialog_run (GTK_DIALOG (dialog)) == GTK_RESPONSE_ACCEPT) {
		char *filename;
		char *selected;
		selected = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog));

		filename = malloc (strlen (selected) + 5);
		strcpy (filename, selected);

		if (strlen (selected) < 5 || strcmp (".fps", selected + strlen (selected) - 4)) {
			strcat (filename, ".fps");
		}

		if (!fst_save_state (jvst->fst, filename)) {
			GtkWidget * errdialog = gtk_message_dialog_new (GTK_WINDOW (window),
					GTK_DIALOG_DESTROY_WITH_PARENT,
					GTK_MESSAGE_ERROR,
					GTK_BUTTONS_CLOSE,
					"Error saving file '%s'",
					filename);
			gtk_dialog_run (GTK_DIALOG (errdialog));
			gtk_widget_destroy (errdialog);
		}

		g_free (selected);
		free (filename);
	}
	gtk_widget_destroy (dialog);
	gtk_widget_grab_focus( gtk_socket );
}

static void
load_handler (GtkToggleButton *but, gboolean ptr)
{
	JackVST* jvst = (JackVST*) ptr;

	GtkWidget *dialog;
	dialog = gtk_file_chooser_dialog_new ("Load Plugin State",
			GTK_WINDOW (window),
			GTK_FILE_CHOOSER_ACTION_OPEN,
			GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
			GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT,
			NULL);

	GtkFileFilter * ff = gtk_file_filter_new();
	gtk_file_filter_set_name(ff,"FST Plugin State");
	gtk_file_filter_add_pattern(ff,"*.fps");
	gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog),ff);

	if (gtk_dialog_run (GTK_DIALOG (dialog)) == GTK_RESPONSE_ACCEPT) {
		char *filename;
		filename = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog));

		if (!fst_load_state (jvst->fst, filename)) {
			GtkWidget * errdialog = gtk_message_dialog_new (GTK_WINDOW (window),
					GTK_DIALOG_DESTROY_WITH_PARENT,
					GTK_MESSAGE_ERROR,
					GTK_BUTTONS_CLOSE,
					"Error loading file '%s'",
					filename);
			gtk_dialog_run (GTK_DIALOG (errdialog));
			gtk_widget_destroy (errdialog);
		}

		g_free (filename);
	}
	gtk_widget_destroy (dialog);
	gtk_widget_grab_focus( gtk_socket );
}

static void
remove_handler (GtkToggleButton *but, gboolean ptr)
{
	JackVST* jvst = (JackVST*) ptr;
	
	jack_deactivate (jvst->client);
	fst_destroy_editor (jvst->fst);
}

static gboolean
configure_handler (GtkWidget* widget, GdkEventConfigure* ev, GtkSocket *sock)
{
	XEvent event;
	gint x, y;
	GdkWindow *w;

	g_return_if_fail (sock->plug_window != NULL);

	w = sock->plug_window;
	event.xconfigure.type = ConfigureNotify;

	event.xconfigure.event = GDK_WINDOW_XWINDOW (w);
	event.xconfigure.window = GDK_WINDOW_XWINDOW (w);

	/* The ICCCM says that synthetic events should have root relative
	 * coordinates. We still aren't really ICCCM compliant, since
	 * we don't send events when the real toplevel is moved.
	 */
	gdk_error_trap_push ();
	gdk_window_get_origin (w, &x, &y);
	gdk_error_trap_pop ();

	event.xconfigure.x = x;
	event.xconfigure.y = y;
	event.xconfigure.width = GTK_WIDGET(sock)->allocation.width;
	event.xconfigure.height = GTK_WIDGET(sock)->allocation.height;

	event.xconfigure.border_width = 0;
	event.xconfigure.above = None;
	event.xconfigure.override_redirect = False;

	gdk_error_trap_push ();
	XSendEvent (gdk_x11_drawable_get_xdisplay (w),
		    GDK_WINDOW_XWINDOW (sock->plug_window),
		    False, StructureNotifyMask, &event);
	//gdk_display_sync (gtk_widget_get_display (GTK_WIDGET (sock)));
	gdk_error_trap_pop ();

	return FALSE;
}

void
forward_key_event (GtkSocket *sock, GdkEventKey* ev, JackVST* jvst)
{
	XKeyEvent event;
	Status status;

	g_return_if_fail (sock->plug_window != NULL);
	
	event.type = (ev->type == GDK_KEY_PRESS ? KeyPress : KeyRelease);
	event.display = gdk_x11_drawable_get_xdisplay (sock->plug_window);
	event.window = fst_get_XID (jvst->fst);
	event.time = ev->time;
	event.x = 1;
	event.y = 1;
	event.x_root = 1;
	event.y_root = 1;
	event.state = ev->state;
	event.keycode = ev->hardware_keycode;
	event.same_screen = True;
	
	gdk_error_trap_push ();
	XSendEvent (event.display, event.window, False, 0, (XEvent*) &event);
	gdk_display_sync (gtk_widget_get_display (GTK_WIDGET (sock)));
	gdk_error_trap_pop ();
}

static gboolean
destroy_handler (GtkWidget* widget, GdkEventAny* ev, gpointer ptr)
{
	JackVST* jvst = (JackVST*) ptr;
	fst_destroy_editor (jvst->fst);
	//exit (0);
	gtk_main_quit();
	
	return FALSE;
}

int
focus_handler (GtkWidget* widget, GdkEventFocus* ev, gpointer ptr)
{
	if (ev->in) {
		fst_error ("Socket focus in");
	} else {
		fst_error ("Socket focus out");
	}
		       
	return FALSE;
}

static void
program_change (GtkComboBox *combo, JackVST *jvst)
{
	int program = gtk_combo_box_get_active (combo);
	printf ("active: %d\n", program );
	// cant be done here. plugin only expects one GUI thread.
	//jvst->fst->plugin->dispatcher( jvst->fst->plugin, effSetProgram, 0, program, NULL, 0.0 );
	jvst->fst->want_program = program;
	gtk_widget_grab_focus( gtk_socket );
}

static gboolean
idle_cb(JackVST *jvst)
{
	if (quit) {
		gtk_widget_destroy( window );
		fst_destroy_editor( jvst->fst);
		gtk_main_quit();
		//g_quit = TRUE;
		return FALSE;
	}

	if( jvst->fst->want_program == -1 && gtk_combo_box_get_active( GTK_COMBO_BOX( preset_listbox ) ) != jvst->current_program )
		gtk_combo_box_set_active( GTK_COMBO_BOX( preset_listbox ), jvst->current_program );

	if( jvst->midi_learn && jvst->midi_learn_CC != -1 && jvst->midi_learn_PARAM != -1 ) {
		if( jvst->midi_learn_CC < 128 ) {
			jvst->midi_map[jvst->midi_learn_CC] = jvst->midi_learn_PARAM;
		}
		jvst->midi_learn = 0;
		gtk_toggle_button_set_active( GTK_TOGGLE_BUTTON( midi_learn_toggle ), 0 );
	}

	return TRUE;
}

GtkListStore *create_preset_store( FST *fst )
{
	GtkListStore *retval = gtk_list_store_new( 2, G_TYPE_STRING, G_TYPE_INT );
	int i;
	int vst_version = fst->plugin->dispatcher (fst->plugin, effGetVstVersion, 0, 0, NULL, 0.0f);
	for( i=0; i<fst->plugin->numPrograms; i++ )
	{
		char buf[100];
		GtkTreeIter new_row_iter;

		snprintf( buf, 90, "preset %d", i );
		if( vst_version >= 2 ) 
			fst->plugin->dispatcher( fst->plugin, 29, i, 0, buf, 0.0 );

		gtk_list_store_insert( retval, &new_row_iter, i );
		gtk_list_store_set( retval, &new_row_iter, 0, buf, 1, i, -1 );
	}

	if( fst->plugin->numPrograms > 0 )
		fst->plugin->dispatcher( fst->plugin, effSetProgram, 0, 0, NULL, 0.0 );
	else
	{
		GtkTreeIter new_row_iter;
		gtk_list_store_insert( retval, &new_row_iter, 0 );
		gtk_list_store_set( retval, &new_row_iter, 0, "no programs", 1, 0, -1 );
	}

	return retval;
}
int
manage_vst_plugin (JackVST* jvst)
{
	// create a GtkWindow containing a GtkSocket...
	//
	// notice the order of the functions.
	// you can only add an id to an anchored widget.
	GtkCellRenderer *renderer;
	
	window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	gtk_window_set_title (GTK_WINDOW(window), jvst->handle->name);

	vpacker = gtk_vbox_new (FALSE, 7);
	hpacker = gtk_hbox_new (FALSE, 7);
	bypass_button = gtk_toggle_button_new_with_label ("bypass");
	mute_button = gtk_toggle_button_new_with_label ("mute");
	remove_button = gtk_toggle_button_new_with_label ("remove");
	midi_learn_toggle = gtk_toggle_button_new_with_label ("midi Learn");
	save_button = gtk_button_new_with_label ("save state");
	load_button = gtk_button_new_with_label ("load state");


	//----------------------------------------------------------------------------------
	preset_listbox = gtk_combo_box_new_with_model( GTK_TREE_MODEL(create_preset_store( jvst->fst )) );

	renderer = gtk_cell_renderer_text_new ();
	gtk_cell_layout_pack_start (GTK_CELL_LAYOUT (preset_listbox), renderer, TRUE);
	gtk_cell_layout_set_attributes (GTK_CELL_LAYOUT (preset_listbox), renderer, "text", 0, NULL);
	gtk_combo_box_set_active( GTK_COMBO_BOX(preset_listbox), 0 );
	g_signal_connect( G_OBJECT(preset_listbox), "changed", G_CALLBACK( program_change ), jvst ); 
	//----------------------------------------------------------------------------------


	g_signal_connect (G_OBJECT(bypass_button), "toggled",
			    G_CALLBACK(bypass_handler),
			    jvst);

	g_signal_connect (G_OBJECT(mute_button), "toggled",
			    G_CALLBACK(mute_handler),
			    jvst);

	g_signal_connect (G_OBJECT(midi_learn_toggle), "toggled",
			    G_CALLBACK(learn_handler),
			    jvst);

	g_signal_connect (G_OBJECT(remove_button), "toggled",
			    G_CALLBACK(remove_handler),
			    jvst);

	g_signal_connect (G_OBJECT(load_button), "clicked",
			    G_CALLBACK(load_handler),
			    jvst);

	g_signal_connect (G_OBJECT(save_button), "clicked",
			    G_CALLBACK(save_handler),
			    jvst);


	gtk_container_set_border_width (GTK_CONTAINER(hpacker), 3);

	g_signal_connect (G_OBJECT(window), "delete_event",
			    G_CALLBACK(destroy_handler),
			    jvst);

	gtk_socket = gtk_socket_new ();
	GTK_WIDGET_SET_FLAGS(gtk_socket, GTK_CAN_FOCUS);
	
	gtk_box_pack_end   (GTK_BOX(hpacker), midi_learn_toggle, FALSE, FALSE, 0);
	gtk_box_pack_end   (GTK_BOX(hpacker), preset_listbox, FALSE, FALSE, 0);
	gtk_box_pack_end   (GTK_BOX(hpacker), bypass_button, FALSE, FALSE, 0);
	gtk_box_pack_end   (GTK_BOX(hpacker), mute_button, FALSE, FALSE, 0);
	gtk_box_pack_end   (GTK_BOX(hpacker), load_button, FALSE, FALSE, 0);
	gtk_box_pack_end   (GTK_BOX(hpacker), save_button, FALSE, FALSE, 0);
	// gtk_box_pack_end   (GTK_BOX(hpacker), remove_button, FALSE, FALSE, 0);
	gtk_box_pack_start (GTK_BOX(vpacker), hpacker, FALSE, FALSE, 0);
	gtk_box_pack_start (GTK_BOX(vpacker), gtk_socket, TRUE, FALSE, 0);

	gtk_container_add (GTK_CONTAINER (window), vpacker);

	// normally every socket should register it self like this.
	g_signal_connect (G_OBJECT(window), "configure_event",
			    G_CALLBACK(configure_handler),
			    gtk_socket);


	// but you can show() a GtkSocket only with an id set.
	gtk_socket_add_id (GTK_SOCKET (gtk_socket), fst_get_XID (jvst->fst));
	
	SetWindowPos (jvst->fst->window, 0, 0, 0, jvst->fst->width, jvst->fst->height+24, 0);
	ShowWindow (jvst->fst->window, SW_SHOWNA);

 	gtk_widget_show_all (window);
	gtk_widget_grab_focus( gtk_socket );

	g_timeout_add(500, (GSourceFunc) idle_cb, jvst);

	printf( "calling gtk_main now\n" );
	gtk_main ();

	return 0;
}


typedef int (*error_handler_t)( Display *, XErrorEvent *);
static Display *the_gtk_display;
error_handler_t wine_error_handler;
error_handler_t gtk_error_handler;

int fst_xerror_handler( Display *disp, XErrorEvent *ev )
{
	if( disp == the_gtk_display ) {
		printf( "relaying error to gtk\n" );
		return gtk_error_handler( disp, ev );
	} else {
		printf( "relaying error to wine\n" );
		return wine_error_handler( disp, ev );
	}
}

void
gui_init (int *argc, char **argv[])
{
	wine_error_handler = XSetErrorHandler( NULL );
	gtk_init (argc, argv);
	the_gtk_display = gdk_x11_display_get_xdisplay( gdk_display_get_default() );
	gtk_error_handler = XSetErrorHandler( fst_xerror_handler );
}
