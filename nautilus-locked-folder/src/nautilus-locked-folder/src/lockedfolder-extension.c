/* nautilus-locked-folder : A data encryption plugin for Nautilus
   Copyright (C) 2005 Jon Manning

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA. */

#include <libnautilus-extension/nautilus-extension-types.h>
#include <libnautilus-extension/nautilus-file-info.h>
#include <libnautilus-extension/nautilus-info-provider.h>
#include <libnautilus-extension/nautilus-menu-provider.h>
#include <openssl/evp.h>
#include <openssl/sha.h>
#include <gtk/gtk.h>
#include <gtk/gtkstock.h>

#include "lockedfolder.h"

#include <glade/glade.h>
#include <libgnomeui/libgnomeui.h>

//#define GLADE_FILE DATADIR G_DIR_SEPARATOR_S "lockedfolders.glade"

#define NAUTILUS_TYPE_LOCKED_FOLDER_EXT  (nautilus_locked_folder_ext_get_type ())
#define NAUTILUS_LOCKED_FOLDER_EXT(o)    (G_TYPE_CHECK_INSTANCE_CAST ((o), NAUTILUS_TYPE_LOCKED_FOLDER_EXT, NautilusLockedFolderExt))

/**********************************************************************/
/* GObject foo */


typedef struct {
	   GObject parent;
			 
} NautilusLockedFolderExt;

typedef struct {
	   GObjectClass parent_class;
			 
} NautilusLockedFolderExtClass;



static GObjectClass *parent_class;
static GType lf_type = 0;

	
static GType
nautilus_locked_folder_ext_get_type (void)
{
	   return lf_type;
}

static void
locked_folder_ext_instance_init (NautilusLockedFolderExt *ext)
{
	
}

gboolean
lockedfolder_update_progress (LockedFolderDestinationInfo *info)
{
	   gdouble fraction;
	   if (info->target->status->files_done ==
	       info->target->status->files_total || 
	       info->target->status->cancel_op == TRUE) {
			 return FALSE; // no updates for you!
	   }
	
	   fraction = info->target->status->files_done /
		   info->target->status->files_total;
	   gtk_progress_bar_set_fraction (GTK_PROGRESS_BAR (info->target->progressbar),
					  fraction);
	   return TRUE;
}

gboolean
lockedfolder_destroy_dialog (LockedFolderInfo *info)
{
	   // free the resources and destroy the dialog
	   g_free(info->name);
	   g_free(info->uri);
	   g_free(info->parent_uri);
	   gtk_widget_destroy(info->dialog);
	   g_free(info);
	   return FALSE;
}

/*static void lockedfolder_cancel_callback(GtkDialog *dialog, GtkResponseType response, LockedFolderInfo *info)
  {
  info->status->cancel_op = TRUE;
  gtk_widget_destroy(GTK_WIDGET(dialog));
  }*/

static void
lockedfolder_encrypt_dialog_callback (GtkDialog *dialog,
				      GtkResponseType response,
				      LockedFolderInfo *info)
{
	
	   if (response == GTK_RESPONSE_CANCEL) {
			 // never mind, then
			 g_free(info);
			 gtk_widget_destroy(GTK_WIDGET(dialog));
			 return;
	   }
	
	   info->key = (char*)gnome_password_dialog_get_password(GNOME_PASSWORD_DIALOG(dialog));
	   gtk_widget_destroy(GTK_WIDGET(dialog));
	   g_thread_create((GThreadFunc)lock_folder, info, FALSE, NULL);
}
     
static void
lockedfolder_decrypt_dialog_callback (GtkDialog *dialog,
							   GtkResponseType response,
							   LockedFolderInfo *info)
{
	   //GladeXML *xml;
	   //GtkWidget *progress_dialog;
	   //GtkWidget *progress_bar;
	   //char *tmp;
	
	   if (response == GTK_RESPONSE_CANCEL) {
			 // the data remains safely guarded!
			 g_free(info);
			 gtk_widget_destroy(GTK_WIDGET(dialog));
			 return;
	   }
	
	   info->key = (char*)gnome_password_dialog_get_password(GNOME_PASSWORD_DIALOG(dialog));
	   info->status = g_new0(LockedFolderStatus, 1);
	
	   /*tmp = g_build_path(G_DIR_SEPARATOR_S, GLADEDIR, "lockedfolders.glade", NULL);
		xml = glade_xml_new(tmp, NULL, NULL);*/
	
	   gtk_widget_destroy(GTK_WIDGET(dialog)); // TODO: replace

	   /*progress_dialog = glade_xml_get_widget(xml, "progress-dialog");
		progress_bar = glade_xml_get_widget(xml, "progress-bar");
	
		g_signal_connect(progress_dialog, "response", G_CALLBACK(lockedfolder_cancel_callback), info);
		gtk_widget_show(GTK_WIDGET(progress_dialog)); */
	
	   //info->dialog = progress_dialog;
	   //info->progressbar = progress_bar;
	
	   g_thread_create((GThreadFunc)unlock_folder, info, FALSE, NULL);
}
      
static void
lockedfolder_do_encrypt (NautilusMenuItem *item,
					gpointer user_data)
{
	   NautilusFileInfo* file;
	   LockedFolderInfo* lfinfo;

	   file = (NautilusFileInfo*)g_object_get_data(G_OBJECT(item), "file");

	
	   lfinfo = g_new0(LockedFolderInfo, 1);
	   lfinfo->name = nautilus_file_info_get_name(file);
	   lfinfo->uri = nautilus_file_info_get_uri(file);
	   lfinfo->parent_uri = nautilus_file_info_get_parent_uri(file);
	
	   GtkWidget* auth_box = GTK_WIDGET(gnome_password_dialog_new(
									    "Lock Folder",
									    "Please enter a password to lock this folder with.\n\nDon't forget this password! You cannot access the locked data without it.",
									    NULL,
									    NULL,
									    TRUE));
	   gnome_password_dialog_set_show_username(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	   gnome_password_dialog_set_show_domain(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	   gnome_password_dialog_set_show_remember(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	   gnome_password_dialog_set_show_userpass_buttons(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	
	   lfinfo->dialog = auth_box;
	
	   g_signal_connect(auth_box, "response", G_CALLBACK(lockedfolder_encrypt_dialog_callback), lfinfo);
	
	   gtk_widget_show(auth_box);
	
	
	   // lock_folder(lfinfo);
}

static void
lockedfolder_do_decrypt (NautilusMenuItem *item,
					gpointer user_data)
{
	   NautilusFileInfo* file;
	   LockedFolderInfo* lfinfo;
	
	   file = (NautilusFileInfo*)g_object_get_data(G_OBJECT(item), "file");
	   lfinfo = g_new0(LockedFolderInfo, 1);
	   lfinfo->name = nautilus_file_info_get_name(file);
	   lfinfo->uri = nautilus_file_info_get_uri(file);
	   lfinfo->parent_uri = nautilus_file_info_get_parent_uri(file);
	
	   GtkWidget* auth_box = GTK_WIDGET(gnome_password_dialog_new(
									    "Unlock Folder",
									    "Please provide the password to unlock this folder.",
									    NULL,
									    NULL,
									    TRUE));
	   gnome_password_dialog_set_show_username(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	   gnome_password_dialog_set_show_domain(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	   gnome_password_dialog_set_show_remember(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
	   gnome_password_dialog_set_show_userpass_buttons(GNOME_PASSWORD_DIALOG(auth_box), FALSE);
		
	   lfinfo->dialog = auth_box;
	
	   g_signal_connect(auth_box, "response", G_CALLBACK(lockedfolder_decrypt_dialog_callback), lfinfo);
	
	   gtk_widget_show(auth_box);
	
	
	
	   //g_thread_create(unlock_folder, lfinfo, FALSE, NULL);
	   //unlock_folder(lfinfo);
}
	
 
static void
locked_folder_ext_class_init (NautilusLockedFolderExtClass *class)
{
	   parent_class = g_type_class_peek_parent (class);
} 

static GList *
lockedfolder_get_file_items (NautilusMenuProvider *provider,
					    GtkWidget *window,
					    GList *files)
{
	   NautilusFileInfo *file;
	   NautilusMenuItem *item;
	   char *filename;
	   char *scheme;
	   GList *items;
  
	   if (files == NULL) {
		return NULL;
	   }
	   
	   file = NAUTILUS_FILE_INFO(files->data);
	   scheme = nautilus_file_info_get_uri_scheme (file);
	   
	   if (!g_str_equal (scheme, "file")) {
		g_free (scheme);
		return NULL;
	   }
	   
	   g_free (scheme);
	   
	   if (g_list_length(files) != 1) {
		   return NULL;
	   }
			 
	   if (!nautilus_file_info_is_directory(file)) {
		   filename = nautilus_file_info_get_name (file);
		   if (!g_str_has_suffix(filename, ".locked")) {
			   g_free(filename);
			   return NULL;
		   }
		   // it's a .locked archive! hoorah
		   item = nautilus_menu_item_new ("NautilusLockedFolder::Unlock",
						  "Unlock folder", "Decrypt this folder",
						  "/usr/share/icons/hicolor/32x32/stock/data/stock_lock-open.png"); 
						  // ^ this needs to get fixed like right away to use theming ^
		   g_signal_connect (item,
				     "activate",
				     G_CALLBACK(lockedfolder_do_decrypt),
				     provider);
			 } else {
				 item = nautilus_menu_item_new("NautilusLockedFolder::Lock",
							       "Lock folder",
							       "Encrypt this folder",
							       "/usr/share/icons/hicolor/32x32/stock/data/stock_lock.png"); // <-- fix also
				 g_signal_connect (item,
						   "activate",
						   G_CALLBACK (lockedfolder_do_encrypt),
						   provider);

			 }
			 
	   g_object_set_data (G_OBJECT(item), "file", file);
	   items = g_list_append(NULL, item);
	   
	   return items;
}

static void
lockedfolder_menu_provider_iface_init (NautilusMenuProviderIface *iface)
{
	   iface->get_file_items = lockedfolder_get_file_items;
}

static void lockedfolder_nautilus_register_type (GTypeModule *module)
{
static const GTypeInfo info = {

	   sizeof (NautilusLockedFolderExtClass),
	   (GBaseInitFunc) NULL,
	   (GBaseFinalizeFunc) NULL,
	   (GClassInitFunc) locked_folder_ext_class_init,
	   NULL,
	   NULL,
	   sizeof (NautilusLockedFolderExt),
	   0,
	   (GInstanceInitFunc) locked_folder_ext_instance_init,
};

	   static const GInterfaceInfo info_provider_iface_info = {
			 (GInterfaceInitFunc) lockedfolder_menu_provider_iface_init,
			 NULL,
			 NULL
	   };
			 
	   lf_type = g_type_module_register_type (module, 
									  G_TYPE_OBJECT,
									  "NautilusLockedFolderExt",
									  &info,
									  0);
			 
	   g_type_module_add_interface (module,
							  lf_type,
							  NAUTILUS_TYPE_MENU_PROVIDER,
							  &info_provider_iface_info);
}

/* Perform module-specific shutdown. */
void nautilus_module_shutdown (void)
{
	   g_print("LockedFolder module shutting down\n");
}

void nautilus_module_list_types (const GType **types,
						   int          *num_types)
{
	   static GType type_list[1];
	   type_list[0] = NAUTILUS_TYPE_LOCKED_FOLDER_EXT;

	   *types = type_list;
	   *num_types = 1;
}


void remove_dir(char *path)
{
	   
	   GDir* dir;
	   char* fullpath;
	   gchar* entry;
	   
	   dir = g_dir_open(path, 0, NULL);
	   
	   if (!dir) {
			 return;
	   }
	   
	   while ((entry = (gchar*)g_dir_read_name(dir))) {
			 fullpath = g_build_path(G_DIR_SEPARATOR_S, path, entry, NULL);
			 if (g_file_test(fullpath, G_FILE_TEST_IS_DIR) == TRUE) {
				    remove_dir(fullpath);
			 }
			 remove(fullpath);
			 g_free(fullpath);
	   }
	   
	   remove(path);
	   g_dir_close(dir);
}

void nautilus_module_initialize(GTypeModule *module)
{
	   g_print("Loading LockedFolder module..\n");
	   lockedfolder_nautilus_register_type(module);
}
