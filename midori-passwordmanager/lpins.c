/*
 Copyright (C) 2011 Giuseppe Borzi <gborzi@ieee.org>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.
*/


#include <gnome-keyring.h>


int main( int argc, char **argv ) {

   if ( argc < 4 ) {
      g_print("Usage: %s url user password\n",argv[0]);
      return 1;
   }

   if ( gnome_keyring_is_available() ) {
      guint32 item_id;
      gnome_keyring_set_network_password_sync(NULL,
                                              argv[2],
                                              "midori",
                                              argv[1],
                                              NULL,
                                              NULL,
                                              NULL,
                                              0,
                                              argv[3],
                                              &item_id);
      g_print("Created Gnome Keyring entry # %d\n",item_id);
   } else {
      g_print("Gnome Keyring not available!\n");
      return 1;
   }
   return 0;
}
