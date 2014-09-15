# Maintainer: Pirea Radu <pirea.radu@gmail.com>

pkgname=sunxi-livesuite
pkgver=307
pkgrel=1
pkgdesc="LiveSuit is a tool to flash Images to the NAND of Allwinner devices"
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-livesuite"
license=('GPL')
depends=('libpng12')
makedepends=('git')
conflicts=()
source=("$pkgname"::'git+https://github.com/linux-sunxi/sunxi-livesuite.git'
	'LiveSuit')
sha256sums=('SKIP'
            '615b76cffe8c8561a347f9cb97b85b8be9224bc344690ef01b8b67882b4015a7')

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	if [ $(uname -m) == 'x86_64' ] ; then
		cp "$srcdir/$pkgname/x86-64/"* "$pkgdir/opt/$pkgname/"
	fi

	if [ uname -m == 'i686' ] ; then
		cp "$srcdir/$pkgname/x86/"* "$pkgdir/opt/$pkgname/"
	fi
	
	cp "$srcdir/LiveSuit" "$pkgdir/usr/bin"
}
