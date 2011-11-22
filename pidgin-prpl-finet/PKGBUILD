# Maintainer: roughl

pkgname=pidgin-prpl-finet
pkgver=0.1.0
pkgrel=1
pkgdesc="A pidgin protocol plugin for the finet network"
arch=('i686' 'x86_64')
url="http://github.com/roughl/${pkgname}"
source=("http://github.com/roughl/${pkgname}/tarball/${pkgver}")
license=('GPL')
depends=('osxcart' 'libpurple')
optdepends=()

build() {
	cd *$pkgname*
	make
	PREFIX=$pkgdir/usr/ make install
}

md5sums=('8427f05697547bcda9af6d31dc7d1a7e')
