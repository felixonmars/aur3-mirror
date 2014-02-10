# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=cannya
pkgver=1.03
pkgrel=1
pkgdesc='A dictionary viewer for canna'
arch=('i686' 'x86_64')
url="http://www.geocities.co.jp/SiliconValley-SanJose/4514/monooki.html"
license=('GPL')
depends=('canna' 'gtk')
source=("http://www.geocities.co.jp/SiliconValley-SanJose/4514/archive/cannya-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/cannya-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/cannya-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('3ba23de96db93c73506afc7cceca9fcf')
