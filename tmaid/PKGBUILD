# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=tmaid
pkgver=2.7.8
_sfver=60181
pkgrel=1
pkgdesc='A GTK+ text editor'
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/tmaid/"
license=('GPL3')
depends=('gtk2')
source=("http://iij.dl.sourceforge.jp/tmaid/${_sfver}/tmaid-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/tmaid-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/tmaid-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('0868829638e6aa9d26a797fb6c505f43')
