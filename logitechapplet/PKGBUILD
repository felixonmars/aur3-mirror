# Contributor: Lawrence Lee <valheru AT facticius DOT net>
pkgname=logitechapplet
pkgver=0.2
pkgrel=1
pkgdesc="Frontend written in Qt4 for interfacing via DBUS with logitechdaemon."
arch=('i686' 'x86_64')
url="http://code.google.com/p/logitechapplet/"
license=('GPL')
depends=('qt4>=4.2' 'dbus')
makedepends=('cmake>=2.4' 'subversion')
source=(http://logitechapplet.googlecode.com/files/LogitechApplet-$pkgver.tar.bz2)
md5sums=('2ff6e4d340170886c142b462d0cde095')

build() {
	mkdir $startdir/src/LogitechApplet-build
	cd $startdir/src/LogitechApplet-build

	cmake ../LogitechApplet
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/LogitechApplet-build
}

# vim:set ts=2 sw=2 et:
