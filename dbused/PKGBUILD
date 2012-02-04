# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="dbused"
pkgver=0.2.2
pkgrel=1
pkgdesc="Small tool to react on signals from DBus."
arch=('i686' 'x86_64')
url="http://dbused.tuxfamily.org/"
license=('GPL2')
depends=('dbus-core' 'expat')
makedepends=('cmake')
source=("http://download.tuxfamily.org/dbused/dbused-0.2.2.tar.bz2")
md5sums=('81ce95ed2971e79a113bb180da86f11b  dbused-0.2.2.tar.bz2')
sha256sums=('6b0af78b9a4a83f745a3ba97fea28227b4298c6d10cfee17531b1fc77a4b4e81')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
   	make || return 1
	make DESTDIR=${startdir}/pkg install
}

# vim:ts=4:sw=4:noet:enc=utf-8:
