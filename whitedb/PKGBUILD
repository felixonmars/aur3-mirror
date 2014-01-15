# Maintainer: ushi <ushi+arch@honkgong.info>
pkgname=whitedb
pkgver=0.7.1
pkgrel=1
epoch=
pkgdesc="Lightweight database library operating fully in main memory."
arch=('i686' 'x86_64')
url="http://whitedb.org/"
license=('GPL')
source=("http://whitedb.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('2e455a956377d3f014f8c32af399ce24')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
