#Maintainer: Jonas Heinrich <onny@project-insanity.org>
#Contributor: Jonas Heinrich <onny@project-insanity.org>
#Contributor: Sébastien Duquette <ekse.0x@gmail.com>
#Contributor: Dawid Wrobel <cromo@klej.net>

pkgname=ddiwrapper
pkgver=0.3
pkgrel=2
pkgdesc="Support for Windows Printer Drivers under Linux"
url="http://www.novell.com/products/linuxpackages/opensuse/ddiwrapper.html"
arch=('i686' 'x86_64')
license=("GPL3")
depends=('wine')
source=("http://www.openprinting.org/download/${pkgname}/${pkgname}_${pkgver}-rc1.tgz")
sha512sums=("c6b1f68e3b09c60dd7ba664fefd883834b2bf4d16285a3bb750338a71836c41cf30dfbcdda3e2c065619f988b6d4ff0937e4bfc7b602d9f43a2fa3e5a207196b")

build () {
	cd "${srcdir}/ddiwrapper"
	make
}
package() {
	cd "${srcdir}/ddiwrapper"
	make install
}
