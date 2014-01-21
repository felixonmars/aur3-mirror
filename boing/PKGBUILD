# Maintainer: u8sand <u8sand at gmail dot com>

pkgname=boing
pkgver=0.1
pkgrel=1
pkgdesc="svgalib based breakout game with sound"
url=("http://ibiblio.org/pub/linux/games/arcade/")
arch=('x86_64' 'i686')
license=('custom')
depends=('svgalib' 'svgalib-helper')
source=("http://ibiblio.org/pub/linux/games/arcade/${pkgname}-${pkgver}.tar.gz")
md5sums=('66d9c356f75a541896f232a7f3ec3797')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	gcc boing.c -lvga -lvgagl -lm -o boing -O3
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/share{,/licenses}/${pkgname}
	# uncomment 'boing.c' if you want the source too in /usr/share/boing
	install -m644 -t "$pkgdir/usr/share/$pkgname" *.raw #boing.c
	install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" README
	install -m755 -t "$pkgdir/usr/share/$pkgname" boing
	ln -s "/usr/share/$pkgname/boing" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
