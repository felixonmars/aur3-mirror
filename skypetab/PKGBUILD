# Maintainer: Dmitry <ixaphire at gmail dot com>

pkgname=skypetab
pkgver=0.2.1
pkgrel=1
pkgdesc="Addes tabs support to Skype for Linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/skypetab/"
license=('GPL2')
depends=('gtk-sharp-2')
source=('http://skypetab.googlecode.com/files/skypetab.for_maintainers.tar.gz')
md5sums=('7f8a88a8fe9fbf4e60434b78bc44152b')

build() {
	cd ${srcdir}/skypetab

	make || return 1
}

package() {
	cd ${srcdir}/skypetab

	make DESTDIR=${pkgdir} install
}
