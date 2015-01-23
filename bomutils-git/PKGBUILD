# Maintainer: Reza Jelveh

pkgname=bomutils-git
_pkgname=bomutils
epoch=1
pkgver=20140520.3f7dc2d
pkgrel=1
pkgdesc='Bom utils for linux'
url='https://github.com/hogliux/bomutils/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=()
makedepends=()
source=('git://github.com/hogliux/bomutils')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build && cd build
}

package() {
	cd "${srcdir}/${_pkgname}"
	make install PREFIX=${pkgdir}/usr
}
