pkgname=stardict-mwct
pkgver=2.4.2
pkgrel=1
pkgdesc="Merriam-Webster Collegiate® Thesaurus for Stardict"
arch=(any)
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('46ce07b2db1a89d3e7ffde9f14952d23')
source=(http://prdownloads.sourceforge.net/stardict/stardict-babylon-Merriam_Webster_Collegiate__Th-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-Merriam_Webster_Collegiate__Th-$pkgver/* $pkgdir/usr/share/stardict/dic/
}
