# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ttf-eurostile
pkgver=0
pkgrel=3
pkgdesc='A popular font with an appeal both technical and functional'
arch=('any')
url='http://www.fontyukle.com/en/1,eurostile'
license=('unknown')
depends=(
	'fontconfig'
	'xorg-font-utils'
)
install=ttf.install
source=('http://www.fileden.com/files/2008/12/27/2240700//Eurostile.ttf')
md5sums=('248b57e5d1781bb492a0642260770bea')

build() {
	install -Dm 644 "$srcdir/Eurostile.ttf" "$pkgdir/usr/share/fonts/TTF/Eurostile.ttf"
}
