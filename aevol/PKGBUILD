# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aevol
pkgver=4.2
pkgrel=1
pkgdesc='An in silico experimental evolution platform'
arch=('i686' 'x86_64')
url="http://www.aevol.fr/"
license=('GPL3')
depends=('gcc-libs' 'libx11' 'zlib')
source=("http://gforge.liris.cnrs.fr/frs/download.php/122/aevol-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/aevol-${pkgver}"
	./configure --prefix=/usr --libexecdir=/usr/bin
	make
}

package() {
	cd "${srcdir}/aevol-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('45699a05756d015279bbb34f8a0d144e')
