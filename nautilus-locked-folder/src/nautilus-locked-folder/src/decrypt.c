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
#include <glib/gstdio.h>
#include <string.h>

#include "lockedfolder.h"
void unlock_folder_extract_file(LockedFolderIndex *index, LockedFolderDestinationInfo *info);

void
unlock_folder_extract_file (LockedFolderIndex            *index,
			    LockedFolderDestinationInfo  *info)
{

	FILE* output_file;
	char* fullpath;
	int inlen, outlen;

	EVP_CIPHER_CTX ctx;
	char* filecontents;
	char* uncrypted_contents;
	unsigned char iv[] = "GNOME-VFS-LockedFolder";
	GtkWidget* error_dialog;

	/*if (info->target->status->cancel_op) {
	// we were told to cancel, so we do as we are told
	LockedFolderIndex *i;
	i = (LockedFolderIndex*)info->files->data;
	fullpath = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", info->temp_file_dir, i->filename);
	fclose(output_file);
	remove_dir(fullpath);

	g_thread_exit(NULL);
	}*/

	fullpath = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", info->temp_file_dir, index->filename);

	if (index->is_dir) {
		// we just want to create dirs, not decrypt them
		// nothing to extract; we'll just create the dir
		g_mkdir(fullpath, index->mode /*| S_IXUSR*/);
		return;
	}

	output_file = fopen(fullpath, "wb");

	fseek(info->output_file, index->start, SEEK_SET);


	filecontents = g_malloc0(index->length);
	uncrypted_contents = g_malloc0(index->length + EVP_MAX_BLOCK_LENGTH);

	inlen = fread(filecontents, 1, index->length, info->output_file);
	//outlen = fwrite(filecontents, 1, index->length, output_file);

	/* Don’t set key or IV because we will modify the parameters */
	EVP_CIPHER_CTX_init(&ctx);
	EVP_CipherInit_ex(&ctx,  EVP_bf_cbc(), NULL, NULL, NULL, LF_DECRYPT);
	EVP_CIPHER_CTX_set_key_length(&ctx, strlen(info->key));
	/* We finished modifying parameters so now we can set key and IV */
	EVP_CipherInit_ex(&ctx, NULL, NULL, (unsigned char*)info->key, iv, LF_DECRYPT);


	if(!EVP_CipherUpdate(&ctx, (unsigned char*)uncrypted_contents, &outlen, (unsigned char*)filecontents, index->length)) {
		/* Error */
		//g_error("EVP_CipherUpdate failed\n");
	}

	fwrite(uncrypted_contents, outlen, 1, output_file);

	if(!EVP_CipherFinal_ex(&ctx, (unsigned char*)uncrypted_contents, &outlen)) {
		/* Error */
		// delete the new folder at once and fire off an error dialog
		g_free(fullpath);
		LockedFolderIndex* i;
		i = (LockedFolderIndex*)info->files->data;
		fullpath = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", info->temp_file_dir, i->filename);
		fclose(output_file);
		remove_dir(fullpath);
		g_free(fullpath);
		//gtk_widget_destroy(info->target->dialog);
		error_dialog = gtk_message_dialog_new(NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_OK, "Couldn't unlock the folder");
		gtk_message_dialog_format_secondary_text(GTK_MESSAGE_DIALOG(error_dialog), "The folder could not be unlocked because you provided an incorrect password.");
		g_signal_connect_swapped(error_dialog, "response", G_CALLBACK(gtk_widget_destroy), error_dialog);
		gtk_dialog_run(GTK_DIALOG(error_dialog));
		g_thread_exit(NULL);
	}
	EVP_CIPHER_CTX_cleanup(&ctx);

	fwrite(uncrypted_contents, outlen, 1, output_file);

	fclose(output_file);

	// restore the permissions
	chmod(fullpath, index->mode);
	g_free(fullpath);

	info->target->status->files_done++;

}

gpointer 
unlock_folder (LockedFolderInfo* target) 
{
	char* base_path;
	FILE* input_file;
	char* input_file_name;
	LockedFolderHeader header;
	LockedFolderIndex* index;
	GList* indices;
	GtkWidget* error_dialog;
	LockedFolderDestinationInfo d_info;

	base_path = target->parent_uri + strlen("file://");

	indices = NULL;

	input_file_name = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", base_path, target->name);
	input_file = fopen(input_file_name, "rb");

	fread(&header, sizeof(LockedFolderHeader), 1, input_file);

	if (strcmp(header.magic, "GVFSLockedFolder") != 0) {
		error_dialog = gtk_message_dialog_new(NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_OK, "Couldn't unlock the folder");
		gtk_message_dialog_format_secondary_text(GTK_MESSAGE_DIALOG(error_dialog), "The folder could not be unlocked because this file is not a valid locked folder archive.");
		g_signal_connect_swapped(error_dialog, "response", G_CALLBACK(gtk_widget_destroy), error_dialog);
		gtk_dialog_run(GTK_DIALOG(error_dialog));
		g_thread_exit(NULL);
	}

	int i = 0;
	while (i < header.numfiles) {
		index = g_new0(LockedFolderIndex, 1);
		fread(index, sizeof(LockedFolderIndex), 1, input_file);
		indices = g_list_append(indices, index);
		i++;
	}



	// we'll hack a bit and use this struct
	// this is really terrible and i hate myself for writing this
	d_info.temp_file_dir = base_path;
	d_info.files = indices;
	d_info.output_file = input_file; // gah!
	d_info.key = target->key;
	d_info.target = target;
	d_info.target->status->files_total = header.numfiles;


	// update our nice progress bar
	//timeout_source = g_timeout_add(100, lockedfolder_update_progress, &d_info);
	g_list_foreach(indices, (GFunc)unlock_folder_extract_file, &d_info);
	g_idle_add((GSourceFunc)lockedfolder_destroy_dialog, d_info.target);

	fclose(input_file);	

	// now delete the encrypted archive
	remove(input_file_name);

	//g_source_remove(timeout_source);
	return NULL;
}
