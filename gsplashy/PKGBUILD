# Maintainer: grufo <grossomalpelo at gmail dot com>

pkgname=gsplashy
pkgver=0.1
pkgrel=2
pkgdesc="GTK+ based configuration tool for splashy"
arch=('i686' 'x86_64')
url="http://splashy.alioth.debian.org"
license=('GPL')
depends=('splashy' 'libglade')

source=(http://alioth.debian.org/frs/download.php/2243/${pkgname}-${pkgver}.tar.gz)
md5sums=('391f2f95a9866c849bd908cdf8ebaf45')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}

