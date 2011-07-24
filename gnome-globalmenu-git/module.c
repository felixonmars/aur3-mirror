#include <gtk/gtk.h>
#if GTK_VERSION == 3
#include <header.h>
#else
#include <header-gtk2.h>
#endif
gboolean hook (GSignalInvocationHint * ihint,
	guint n_param_values,
	const GValue * param_values,
	gpointer data) {
	GObject * object = g_value_get_object(&param_values[0]);
	if(GTK_IS_MENU_BAR(object)) {
		if(! menu_has_registered(object)) 
			menu_register(object);
	}
	return TRUE;
}

void appear(GDBusConnection * conn, const gchar * name, const gchar * owner, gpointer data) {
	menu_register_all();
}
void vanish(GDBusConnection * conn, const gchar * name, gpointer data) {

}
void gtk_module_init(int argc, char* argv[]) {
	if (gtk_major_version != GTK_VERSION) return;

	GSettings * settings = g_settings_new("org.globalmenu");
	gboolean enabled = g_settings_get_boolean(settings, "enabled");
	g_object_unref(settings);

	if(!enabled) {
		return;
	}
	MenubarSuperrider * m = menubar_superrider_new();
	guint signal_id = g_signal_lookup("map", GTK_TYPE_WIDGET);
	g_signal_add_emission_hook(signal_id, 0, hook, NULL, NULL);

	g_bus_watch_name(G_BUS_TYPE_SESSION, "org.globalmenu.manager", G_BUS_NAME_WATCHER_FLAGS_AUTO_START,
		appear, vanish, NULL, NULL);
}


