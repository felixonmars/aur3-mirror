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
#include <gtk/gtkstock.h>
#include <glib.h>
#include <glib/gstdio.h>
#include <string.h>
#include <unistd.h>

#include "lockedfolder.h"

void lock_folder_write_indices(LockedFolderIndex* index, LockedFolderDestinationInfo* info);
gboolean lock_folder_status_callback(gpointer userdata);

static LockedFolderIndex*
lock_folder_read_dirinfo(char* base_path,
					char* path)
{
	   struct stat fileinfo;
	   LockedFolderIndex* index;
	   char* fullpath;

	   fullpath = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", base_path, path);
	   index = g_new0(LockedFolderIndex, 1);
	   g_stpcpy(index->filename, path);
	   index->is_dir = TRUE;
	   g_stat(fullpath, &fileinfo);
	   index->mode = fileinfo.st_mode;
	   g_free(fullpath);
	   return index;
	
}

static LockedFolderIndex*
lock_folder_read_fileinfo (char* base_path,
					  char* path)
{
	   struct stat fileinfo;
	   LockedFolderIndex* index;
	   char* fullpath;
	
	   fullpath = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", base_path, path);
	   index = g_new0(LockedFolderIndex, 1);
	   g_stpcpy(index->filename, path);
	   g_stat(fullpath, &fileinfo);
	   index->mode = fileinfo.st_mode;
	   index->length = fileinfo.st_size; // useless because we actually store the length of the encrypted file
	   g_free(fullpath);

	   return index;
}

static void
lock_folder_read_dir (char*   path,
				  char*   base_path,
				  GList** file_list,
				  char*   out_dir,
				  char*   key)
{
	
	   GDir* dir;
	   char* fullpath;
	   char* relative_path;
	   char* filename;
	   char* temp_file_name;
	   LockedFolderIndex* index;
	   LockedFolderIndex* prev_index; // used to determine the last fileid number
	
	   FILE* input_file;
	   FILE* output_file;
	   unsigned char iv[] = "GNOME-VFS-LockedFolder";
	   int inlen, outlen;
	   char inbuf[1024], outbuf[1024 + EVP_MAX_BLOCK_LENGTH];
	   EVP_CIPHER_CTX ctx;
	
	   struct stat temp_fileinfo;
	
	   fullpath = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", base_path, path); 
	   dir = g_dir_open(fullpath, 0, NULL);
	   g_free(fullpath);
	
	   if (!dir) {
			 // todo: error reporting
			 return;
	   }
	
	   while ((filename = (char*)g_dir_read_name(dir))) {
			 fullpath  = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s" G_DIR_SEPARATOR_S "%s", base_path, path, filename);
			 if (g_file_test(fullpath, G_FILE_TEST_IS_DIR) == TRUE) {
				    // Add dir to list and then read
				    relative_path = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", path, filename);
				    index = lock_folder_read_dirinfo(base_path, relative_path);
				    prev_index = (LockedFolderIndex*)(g_list_last(*file_list))->data;
				    index->fileid = prev_index->fileid + 1;
				    *file_list = g_list_append(*file_list, index);
			
				    lock_folder_read_dir(relative_path, base_path, file_list, out_dir, key);
				    g_free(relative_path);
			 } else {
				    // Add file to list and then encrypt
				    relative_path = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", path, filename);
				    index = lock_folder_read_fileinfo(base_path, relative_path);
				    prev_index = (LockedFolderIndex*)(g_list_last(*file_list))->data;
				    index->fileid = prev_index->fileid + 1;
				    *file_list = g_list_append(*file_list, index);
				    g_free(relative_path);
			
				    // Finally, we get to encrypt the file and store it in /tmp/lockedfolder-XXXXXX/
				    // for later (the final phase of this will pick up all of these generated files and put them
				    // in the archive)
				    temp_file_name = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%i.enc", out_dir, (gint)index->fileid);
			
				    input_file = fopen(fullpath, "rb");
				    output_file = fopen(temp_file_name, "wb");
			 
			
				    if (input_file && output_file) {
						  // TODO: sha1 hash of the file
				
						  EVP_CIPHER_CTX_init(&ctx);
						  EVP_CipherInit_ex(&ctx,  EVP_bf_cbc(), NULL, NULL, NULL, LF_ENCRYPT);
						  EVP_CIPHER_CTX_set_key_length(&ctx, strlen(key));
						  /* We finished modifying parameters so now we can set key and IV */
						  EVP_CipherInit_ex(&ctx, NULL, NULL, (unsigned char*)key, iv, LF_ENCRYPT);
				
						  for(;;) {
								inlen = fread(inbuf, 1, 1024, input_file);
								if(inlen <= 0) break;
								if(!EVP_CipherUpdate(&ctx, (unsigned char*)outbuf, &outlen, (unsigned char*)inbuf, inlen)) {
									   /* Error */
									   g_error("EVP_CipherUpdate failed\n");
								}
								fwrite(outbuf, 1, outlen, output_file);
						  }
			  
						  if(!EVP_CipherFinal_ex(&ctx, (unsigned char*)outbuf, &outlen)) {
								/* Error */
								g_error("EVP_CipherFinal_ex failed\n");
						  }
						  fwrite(outbuf, 1, outlen, output_file);

						  EVP_CIPHER_CTX_cleanup(&ctx);
				
						  fclose(input_file);
						  fclose(output_file);
						  if (g_stat(temp_file_name, &temp_fileinfo) == 0) {
								index->length = temp_fileinfo.st_size;
						  } else {
								g_error("Failed to get length of encrypted file");
						  }
				    }
			 }
	   }
	
}

static void
lock_folder_write_files (LockedFolderIndex*           index,
					LockedFolderDestinationInfo* info)
{
	   FILE* input_file;
	   char* temp_file_name;
	   char inbuf[1024];
	   int inlen;
	
	   if (index->is_dir == TRUE) {
			 // dirs exist only as index entries
			 return;
	   }
	

	
	   temp_file_name = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%i.enc",
								 info->temp_file_dir,
								 (gint) index->fileid);

	   input_file = fopen (temp_file_name, "rb");
	
	
	
	   if (!input_file) {
			 g_error("LockedFolder: Can't open the source file for adding to the archive!");
	   }
	
	   for(;;) {
			 inlen = fread(inbuf, 1, 1024, input_file);
			 if(inlen <= 0) break;
    
			 fwrite(inbuf, 1, inlen, info->output_file);
	   }
	   
	   fclose(input_file);
  
	   // now delete that file
  
	   // CONSIDER: shred!
	   unlink (temp_file_name);
	   g_free (temp_file_name);
}
	
void
lock_folder_write_indices (LockedFolderIndex* index,
					  LockedFolderDestinationInfo* info)
{
	   GList* entry;
	   LockedFolderIndex* prev_index;

	   // update the 'start' position of this file
	   entry = g_list_find(info->files, index);
	   if (!entry) {
			 g_error("LockedFolder: File list failed sanity check");
	   }
	
	   if (entry->prev) {
			 prev_index = (LockedFolderIndex*)entry->prev->data;
			 index->start = prev_index->start + prev_index->length;
	   }
	
	   fwrite(index, 1, sizeof(LockedFolderIndex), info->output_file);
}

gboolean
lock_folder_status_callback (gpointer userdata)
{
	   //int i = 1;
	   return FALSE;
}

gpointer
lock_folder (LockedFolderInfo* target) {

	   char* base_path;
	   char temp_folder[] = "/tmp/lockedfolder-XXXXXX";
	   FILE* output_file;
	   char* output_file_name;
	   GList* files;
	   LockedFolderIndex* basedir;
	   LockedFolderHeader header;
	   LockedFolderDestinationInfo* d_info;
	
	   g_idle_add(lock_folder_status_callback, NULL);
	
	   // open a temp directory to stick the encrypted files in
	   mkdtemp(temp_folder);
	
	   base_path = target->parent_uri + strlen("file://");
	
	   // add the base dir as an entry in the file list to get the ball rolling
	   basedir = lock_folder_read_dirinfo(base_path, target->name);
	   basedir->fileid = 0;
	
	   files = g_list_append(NULL, basedir);
	
	   // now traverse the dir, encrypt and add the files
	   lock_folder_read_dir(target->name, base_path, &files, temp_folder, target->key);
	
	   strncpy(header.magic, "GVFSLockedFolder\0", 17);
	   header.version = 1;
	   header.numfiles = g_list_length(files);
	
	   basedir->start = sizeof(LockedFolderHeader) + sizeof(LockedFolderIndex) * header.numfiles;
	
	   // lastly write out the archive
	
	   output_file_name = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s.locked", base_path, target->name);
	   output_file = fopen(output_file_name, "wb");
	   g_free(output_file_name);
	
	   fwrite(&header, 1, sizeof(LockedFolderHeader), output_file);
	
	   d_info = g_new(LockedFolderDestinationInfo, 1);
	   d_info->output_file = output_file;
	   d_info->temp_file_dir = temp_folder;
	   d_info->files = files;
	
	   g_list_foreach(files, (GFunc)lock_folder_write_indices, d_info);
	
	   g_list_foreach(files, (GFunc)lock_folder_write_files, d_info);
	
	   g_free(d_info);
	   fclose(output_file);
	
	   // the archive's done, now we delete the uncrypted directory
	   char* dir_to_kill;
	   dir_to_kill = g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", base_path, target->name);
	   remove_dir(dir_to_kill);
	   g_free(dir_to_kill);
	
	   // all done, now delete the temp directory and tidy up
	   rmdir(temp_folder);
	   g_free(target->name);
	   g_free(target->uri);
	   g_free(target->parent_uri);
	   g_free(target->key);
	   g_free(target);
	   
	   return NULL;	
}
