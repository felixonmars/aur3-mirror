# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=cassiopee-c
pkgver=1.0.1
pkgrel=1
pkgdesc='Cassiopee index and search library C implementation'
arch=('i686' 'x86_64')
url="https://github.com/osallou/cassiopee-c"
license=('GPL3')
depends=('boost-libs' 'google-glog')
makedepends=('boost' 'cppunit' 'cmake')
source=("https://github.com/osallou/cassiopee-c/archive/${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('6dd94925688afd57f2783ca362ca50fb')
