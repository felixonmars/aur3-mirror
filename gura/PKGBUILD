# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=gura
pkgver=0.6.1
pkgrel=1
pkgdesc="An iterator-oriented programming language"
arch=('i686' 'x86_64')
url="http://www.gura-lang.org/"
license=('GPL3')
depends=('gcc-libs' 'readline')
makedepends=('cmake')
source=("https://github.com/gura-lang/gura/releases/download/v${pkgver}/gura-${pkgver}-src.tar.gz")

build() {
	cd "${srcdir}/gura-${pkgver}"
	./configure
	make
}

package() {
	cd "${srcdir}/gura-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('1a698c172fbf696a9af72df098151794')
