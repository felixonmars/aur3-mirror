# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=dangen
pkgver=0.5
pkgrel=1
pkgdesc="A shoot 'em up game where accurate shooting matters"
arch=('i686' 'x86_64')
url="http://www.interq.or.jp/libra/oohara/dangen/"
license=('custom')
depends=('sdl_image')
source=("http://www.interq.or.jp/libra/oohara/dangen/dangen-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/dangen-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/dangen-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('c722bff33fd662bde62483f069059e18')
