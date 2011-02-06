--------------------------------------------------------------------------
  VUmeter Skin for H-K Player

  by Otto Donder (o.donder@chairod.de)

  Audacious-VUmeter skin

  2010/02/28 - first public release

  2010 Otto Donder. General Public License
----------------------------------------------------------------------------

The Player-Skin can be downloaded from:

H-K Player
Gnome-Look (http://www.gnome-look.org)


Installation of the VU-meterplugin:
I searched in the whole internet for a RPM-Package, but I didn't found one.
So You have to install from sources, don`t be afraid, it's easy !

1. Download and untar the Source-File from "Sourceforge"   (http://sourceforge.net/project/showfiles.php?group_id=56771&package_id=52133)
2. Check whether You have installed the GCC Compiler on Your system and update
the XMMS-Player if necessary.
3. Open a console and become root, go into the untared directory of the vumeterplugin.
4. Run following 3 commands one after the other:
./configure or configure
make
make install
When You get an error-message, look at "google" to solve the problem !!!
5. The plugin is now installed. Next You have to make a new directory called VU_Meter_skins in Your local XMMS-directory (/home/~/.xmms/). Move
the "default" and the other Skins from the untared Plugin to the new directory.
Start XMMS and activate the VUmeter-plugin. Ready!
When it doesn't starts, then first have a look on the rights of the new files.

Configuration

You can configure the plugin by clicking the bottom leftside top. I prefer
the settings You can see in the 2 windows of the screenshot.
There is also a config-file in each Skin-directory, there You can set
items as for example the color of the needles and more, more, more...



Have much fun
