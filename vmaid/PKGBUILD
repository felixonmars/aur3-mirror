# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=vmaid
pkgver=2.2.4
_sfver=48081
pkgrel=1
pkgdesc='GTK-based AVI video editor'
arch=('i686' 'x86_64')
url="http://vmaid.sourceforge.jp/"
license=('GPL3')
depends=('gtk2' 'libao')
source=("http://iij.dl.sourceforge.jp/vmaid/${_sfver}/vmaid-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/vmaid-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/vmaid-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('1793223a696e3a98c55e1c115947e449')
