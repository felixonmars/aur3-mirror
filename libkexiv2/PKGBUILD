# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=libkexiv2
pkgver=0.4.0
_orig=kdegraphics
_origpkgver=4.2.1
pkgrel=1
pkgdesc="libkexiv2 as standalone library for digikam-slim"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs' 'exiv2')
makedepends=('pkgconfig' 'cmake' 'automoc4')
conflicts=('kdegraphics')
options=('docs')
source=("http://download.kde.org/stable/${_origpkgver}/src/${_orig}-${_origpkgver}.tar.bz2")
md5sums=('9cc2bc859e678aa6178a5c6cf87eb0ab')

build() {
	cd $srcdir
	mkdir build
	cd build
	cmake ../${_orig}-${_origpkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr || return 1
	cd libs/${pkgname}
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
