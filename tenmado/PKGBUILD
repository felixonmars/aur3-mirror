# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=tenmado
pkgver=0.10
pkgrel=1
pkgdesc="A vertically scrolling, late 1990s style shoot 'em up game"
arch=('i686' 'x86_64')
url="http://www.interq.or.jp/libra/oohara/tenmado/"
license=('custom')
depends=('sdl_image')
source=("http://www.interq.or.jp/libra/oohara/tenmado/tenmado-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/tenmado-${pkgver}"
	./configure --prefix=/usr --localstatedir=/var/lib
	make
}

package() {
	cd "${srcdir}/tenmado-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('6459aac118f956509ded6cb707619df0')
