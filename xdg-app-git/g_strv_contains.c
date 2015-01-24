static gboolean g_strv_contains (const gchar * const *strv, const gchar *s) {
	gint i;

	for (i = 0; strv[i]; i++) {
		if (g_strcmp0 (strv[i], s) == 0)
			return TRUE;
	}

	return FALSE;
}
