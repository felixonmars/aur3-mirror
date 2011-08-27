# $Id: PKGBUILD,v1 2007/06/23
# Maintainer: Andreas Neiser <andreas.neiser@gmail.com>
# Former Maintainer: Vojtech Biberle <bazil.xxl@gmail.com>
# gnome applet for hdapsd

#### CHANGE IF NEEDED ####
#
# disk to be monitored, by default sda and hda
# change to sdb to monitor disk in modern ultrabays
_disk_hda="hda"
#
#### CHANGE IF NEEDED ####

pkgname=gnome-hdaps-applet
pkgver=20081204
pkgrel=1
pkgdesc="Gnome applet for hdapsd"
url="http://www.zen24593.zen.co.uk/hdaps/"
arch="i686 x86_64"
source=(http://www.zen24593.zen.co.uk/hdaps/$pkgname-$pkgver.tar.gz)
md5sums=('9a1b96669310325292e4486ce7f4c962')
license=('GPL')


build() {
	cd $srcdir
	sed -i "s|/sys/block/hda|/sys/block/$_disk_hda|" gnome-hdaps-applet.c
	gcc $(pkg-config --cflags --libs libpanelapplet-2.0) -o gnome-hdaps-applet gnome-hdaps-applet.c
	mkdir -p $pkgdir/usr/share/pixmaps/gnome-hdaps-applet
	install -D -m644  *.png $pkgdir/usr/share/pixmaps/gnome-hdaps-applet
	mkdir -p $pkgdir/usr/lib/bonobo/servers
	install -D -m644 GNOME_HDAPS_StatusApplet.server $pkgdir/usr/lib/bonobo/servers/
	mkdir -p $pkgdir/usr/bin
	install -D -m755 gnome-hdaps-applet $pkgdir/usr/bin/
}
