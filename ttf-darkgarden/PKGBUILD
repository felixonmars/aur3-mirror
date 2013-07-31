pkgname=ttf-darkgarden
pkgver=1.2
pkgrel=1
pkgdesc="Darkgarden font"
arch=(any)
url="http://darkgarden.sourceforge.net/"
license=(GPL OFL)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://downloads.sourceforge.net/project/darkgarden/Dark%20Garden%20Font/$pkgver/darkgarden-$pkgver.ttf.zip)
md5sums=('bfc4be9d71977cc143ca2f1cea6f1e83')

build() {
	install -m 644 -D $srcdir/darkgarden-$pkgver/DarkGardenMK.ttf $pkgdir/usr/share/fonts/TTF/DarkGardenMK.ttf
}
