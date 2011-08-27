pkgname=stardict-collins4
pkgver=2.4.2
pkgrel=1
pkgdesc="Collins COBUILD Advanced Learner's English Dictionary for Stardict"
arch=(any)
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('635a5113be57b6eee9216f524f89aed9')
source=(http://prdownloads.sourceforge.net/stardict/stardict-babylon-collins4-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/stardict-babylon-collins4-$pkgver/* $pkgdir/usr/share/stardict/dic/
}
