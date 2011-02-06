pkgname=stardict-ahd4-image
pkgver=2.4.2
pkgrel=1
pkgdesc="American Heritage Dictionary, 4th Edition - With image"
arch=(any)
conflicts=(stardict-ahd4)
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('1b0d015cf5962d81ced15e7cedade998')
source=(http://prdownloads.sourceforge.net/stardict/stardict-babylon-AHD4_2.8-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-AHD4_2.8-$pkgver/AHD4* $pkgdir/usr/share/stardict/dic/
	mkdir -p $pkgdir/usr/share/stardict/dic/res/
	install -m 644 $srcdir/stardict-babylon-AHD4_2.8-$pkgver/res/* $pkgdir/usr/share/stardict/dic/res/
}
