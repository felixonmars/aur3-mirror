# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=xgrep
pkgver=0.08
pkgrel=1
pkgdesc="XGrep provides a grep-like utility for XML files"
url="http://wohlberg.net/public/software/xml/xgrep/"
license=('custom')
arch=('i686' 'x86_64')
builddepends=('makedepend')
source=("http://wohlberg.net/public/software/xml/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('cc71e1a40a40b0cadd0fd85deb9de78b')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make install DESTDIR=$pkgdir
}
