pkgname=stardict-ahd4
pkgver=2.4.2
pkgrel=1
pkgdesc="American Heritage Dictionary, 4th Edition for Stardict"
arch=(any)
conflicts=(stardict-ahd4-image)
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('db51ed1ed1f07974b93fef856ed131d4')
source=(http://prdownloads.sourceforge.net/stardict/stardict-babylon-AHD4-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-AHD4-$pkgver/AHD4* $pkgdir/usr/share/stardict/dic/
	mkdir -p $pkgdir/usr/share/stardict/dic/res/
	install -m 644 $srcdir/stardict-babylon-AHD4-$pkgver/res/* $pkgdir/usr/share/stardict/dic/res/
}
