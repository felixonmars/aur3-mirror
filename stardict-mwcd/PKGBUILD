pkgname=stardict-mwcd
pkgver=2.4.2
pkgrel=1
pkgdesc="Merriam-Webster Collegiate® Dictionary for Stardict"
arch=(any)
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('0ed1013541645dfc15ce8f54a319f299')
source=(http://prdownloads.sourceforge.net/stardict/stardict-babylon-Merriam_Webster_Collegiate__Di-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-Merriam_Webster_Collegiate__Di-$pkgver/Merriam* $pkgdir/usr/share/stardict/dic/
	mkdir -p $pkgdir/usr/share/stardict/dic/res/
	install -m 644 $srcdir/stardict-babylon-Merriam_Webster_Collegiate__Di-$pkgver/res/* $pkgdir/usr/share/stardict/dic/res/
}
