# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=huludesktop
pkgname=bin32-${_pkgname}
pkgver=0.9.8
pkgrel=2
pkgdesc="Official Hulu Desktop client for Linux. You may need to edit ~/.huludesktop to the correct path of your Flash plugin."
arch=('x86_64')
url="http://www.hulu.com/labs/hulu-desktop-linux"
license=('custom')
groups=('multimedia')
depends=('flashplugin' 'lib32-gtk2' 'glib2')
makedepends=('deb2targz')
optdepends=('lirc: for remote control functionality')
source=("http://download.hulu.com/${_pkgname}_i386.deb")
noextract=("${_pkgname}_i386.deb")
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")


build() {
	cd $srcdir
	deb2targz ${_pkgname}_i386.deb
	tar -zxf ${_pkgname}_i386.tar.gz -C $pkgdir
	# Fix menu entry
	sed -i 's/Categories=GTK;AudioVideo;Audio;Video;Player;TV;/Categories=GNOME;Application;Network;/' $pkgdir/usr/share/applications/${_pkgname}.desktop
}

md5sums=('d9b27d1837ab86526100964e80c3cdd1')
