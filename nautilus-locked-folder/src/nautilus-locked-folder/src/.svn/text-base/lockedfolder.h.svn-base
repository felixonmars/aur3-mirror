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


#define LF_ENCRYPT 1
#define LF_DECRYPT 0

#include <glade/glade.h>


typedef struct {
	   char              magic[17];    /* "GVFSLockedFolder\0" */
	   int               version;
	   unsigned long int numfiles;     /* the number of files this archive contains */
	   char              dirname[256];	/* the name of the folder to create and put the files in */
} LockedFolderHeader;


typedef struct {
	   char                   filename[1024];
	   long int               fileid;
	   mode_t                 mode;     /* permissions */
	   gboolean               is_dir;
	   unsigned long long int start;
	   unsigned long long int length;
	   unsigned char          hash[20]; /* SHA-1 hash */
} LockedFolderIndex;

typedef struct {
	   unsigned long int files_done;
	   unsigned long int files_total;
	   gboolean          cancel_op;
} LockedFolderStatus;


typedef struct {
	   char               *key;
	   char               *name;
	   char               *uri;
	   char               *parent_uri;
	   GtkWidget          *dialog;
	   GtkWidget          *progressbar;
	   LockedFolderStatus *status;
} LockedFolderInfo;

typedef struct {
	   FILE             *output_file;
	   char             *temp_file_dir;
	   GList            *files;
	   char             *key;  /* used by unlock_folder */
	   LockedFolderInfo *target;
} LockedFolderDestinationInfo;




gpointer lock_folder	             (LockedFolderInfo *target);
gpointer unlock_folder                (LockedFolderInfo *target);

gboolean lockedfolder_update_progress (LockedFolderDestinationInfo *info);
gboolean lockedfolder_destroy_dialog  (LockedFolderInfo *info);

void     remove_dir                   (char *path);
