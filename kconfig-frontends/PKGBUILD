# Maintainer: smx
pkgname=kconfig-frontends
pkgver=3.12.0.0
pkgrel=2
pkgdesc="Packaging of the kconfig infrastructure, ready for use by third party projects."
url="http://ymorin.is-a-geek.org/projects/kconfig-frontends"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('ncurses')
optdepends=('gtk: for gconf' 'qt4: for qconf')
makedepends=('autoconf' 'bison' 'flex' 'gperf')
conflicts=()
replaces=()
backup=()
source=("http://ymorin.is-a-geek.org/download/kconfig-frontends/${pkgname}-${pkgver}.tar.xz")
md5sums=('b939280dcc83f8feabd87a1d5f9b00c2')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check(){
	cd "${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${pkgname}-${pkgver}"
	make check
	DESTDIR="${pkgdir}" make install
}
