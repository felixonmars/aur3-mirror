# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=senna
pkgver=1.1.5
_sfver=46945
pkgrel=1
pkgdesc='An embeddable fulltext search engine'
arch=('i686' 'x86_64')
url="http://qwik.jp/senna/"
license=('LGPL')
depends=('mecab')
source=("http://iij.dl.sourceforge.jp/senna/${_sfver}/senna-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/senna-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/senna-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('d4a9509e77100c30f05cb058b4adfeab')
