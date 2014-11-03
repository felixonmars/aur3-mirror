pkgname=libcnbj-2.5
pkgver=2.5
pkgrel=1
pkgdesc="Library to use canon pixus ip3100/ip4100/ip8600 and pixma ip1000/ip1500"
arch=(i686)
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi"
license=('GPL')
source=(http://mambo.kuhp.kyoto-u.ac.jp/~takushi/debian/$pkgname\_0.orig.tar.gz)
md5sums=(10028f8707917149e0cd3e5ca4a0d74c)

build() {
  cd $srcdir/$pkgname-0.orig/libs
  mkdir -p $pkgdir/usr/lib
}

package() {
	cd $srcdir/$pkgname-0.orig/libs
	cp -p lib* $pkgdir/usr/lib
	cp -p -R bjlib $pkgdir/usr/lib/
}
