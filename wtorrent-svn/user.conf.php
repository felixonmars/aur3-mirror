<?php
/*
This file is part of wTorrent.

wTorrent is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

wTorrent is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Modified version of class done by David Marco Martinez
*/

// Default language for the app
define( 'LANGUAGE',             'en');

// SQLite database file (set folder permision 0777 or chmod to httpd server) (wTorrent will create database when running install.php)
define( 'DB_FILE',			'db/database.db');

// Host or IP to connect to rTorrent (lighttpd or apache host and port)
define( 'RT_HOST',			'localhost');
define( 'RT_PORT',			8080);
// This is the scgi.server folder set in lighttpd or apache conf
define( 'RT_DIR',			'RT_RPC2/');
// Set this to false if you don't have any autentification method to access http://<your server>/<RT_DIR>
// This is NOT the user to access wtorrent, your user will be set up after editing this file
define( 'RT_AUTH',			false);
define( 'RT_USER',			'my_user');
define( 'RT_PASSWD',		'my_password');
// where to use multicall or not
// if wTorrent makes your rtorrent crash, set this to true
define( 'NO_MULTICALL',		true);
// Use scriptaculous effects (IMPORTANT: notice the '' arround true or false)
define( 'EFFECTS',	'true');

// Directory in which to save uploaded .torrent files (set folder permision 0777 or chmod to httpd server)
// This reffers to the wtorrent folder, don't use exact paths like /data/watch (see Ticket #104)
define( 'DIR_TORRENTS',		'torrents/');

// Full path to application directory (where index.php is)
define( 'DIR_EXEC',			'/srv/http/wtorrent/');

// Default location to save downloaded files (can be set for every uploaded .torrent on the ui) 
define( 'DIR_DOWNLOAD',		'/data/');

?>
