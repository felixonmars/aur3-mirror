# Contributor: Lawrence Lee <valheru AT facticius DOT net>
pkgname=logitechdaemon
pkgver=0.2
pkgrel=1
pkgdesc="A daemon to control the advanced functions of the Logitech G15 keyboard and the MX Revolution mouse via a DBUS interface"
arch=('i686' 'x86_64')
url="http://code.google.com/p/logitechdaemon/"
license=('GPL')
depends=('glib2' 'libg15render' 'dbus-glib' 'libdaemon')
source=(http://logitechdaemon.googlecode.com/files/LogitechDaemon-$pkgver.tar.bz2)
md5sums=('23afb34a0a85f8647d1e83ba1be15a89')

build() {
	mkdir $startdir/src/LogitechDaemon-build
	cd $startdir/src/LogitechDaemon-build

	cmake ../LogitechDaemon
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/LogitechDaemon-build
}

# vim:set ts=2 sw=2 et:
