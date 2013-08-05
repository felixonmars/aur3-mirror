# Maintainer: Bruno Carnazzi <bcarnazzi@gmail.com>
pkgname=linux-wbfs-manager
pkgver=0.1.12
pkgrel=2
pkgdesc="A WBFS manager for Linux using GTK+"
arch=('i686' 'x86_64')
url="http://code.google.com/p/linux-wbfs-manager/"
license=('GPL2')
depends=('gtk2' 'libglade')
install=${pkgname}.install
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('b5379f2dcdf21699f0b3012c14fbf1a8')

build() {
	cd "${srcdir}/${pkgname}"
	make || return 1
}

package() {
	install -D ${srcdir}/${pkgname}/wbfs_gtk ${pkgdir}/usr/bin/wbfs_gtk
}
