# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=quickplot
pkgver=0.10.8
pkgrel=1
pkgdesc='A fast interactive 2D plotter'
arch=('i686' 'x86_64')
url="http://quickplot.sourceforge.net/"
license=('GPL3')
depends=('gtk3' 'libsndfile')
source=("http://downloads.sourceforge.net/project/quickplot/quickplot-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/quickplot-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/quickplot-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('1f5471bd32b48af658adfbddd478ac5a')
