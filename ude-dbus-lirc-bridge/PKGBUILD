# Maintainer: Dan Saul aur by cryingwolf at org
pkgname=ude-dbus-lirc-bridge
_datever=20101020
_miniver=1
pkgver=$_datever.$_miniver
pkgrel=1

pkgdesc="LIRC to DBus bridge."
arch=(any)
url="http://code.google.com/p/ude-dbus-lirc-bridge/"
license=('GPL3')
source=(http://ude-dbus-lirc-bridge.googlecode.com/files/$pkgname.src.$pkgver.tar.xz launchscript)
depends=(
			python2
			pygobject
			pygtk
			gnome-python-desktop
			)
md5sums=('ff71ac94a80f7719492142d30346adf8'
         '34df0e815f2d26ffe9d3241f2d5db434')




build() {
	cd $srcdir/$pkgname
	python2 -m compileall .
	
	mkdir -p $pkgdir/usr/share/ude/dbus-lirc-bridge
	#cp $srcdir/$pkgname/*.py $pkgdir/usr/share/ude/dbus-lirc-bridge
	cp $srcdir/$pkgname/*.pyc $pkgdir/usr/share/ude/dbus-lirc-bridge
	cp $srcdir/$pkgname/lircrc $pkgdir/usr/share/ude/dbus-lirc-bridge/lircrc
	
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/launchscript $pkgdir/usr/bin/ude-dbus-lirc-bridge
	chmod +x $pkgdir/usr/bin/ude-dbus-lirc-bridge
	
	#mkdir -p $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/AUTHORS $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/COPYING $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/INSTALL $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/LICENCE $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/README $pkgdir/usr/share/licenses/ude/media-player
}

