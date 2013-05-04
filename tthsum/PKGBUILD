# Maintainer: Stanislav GE <ginermail@gmail.com>

pkgname=tthsum
pkgver=1.3.1
pkgrel=1
pkgdesc="tthsum tiger tree hash creator/verifier"
arch=(i686 x86_64)
url=http://tthsum.devs.nu
license=(GPL3)
depends=(glibc)
source=(http://tthsum.devs.nu/pkg/$pkgname-$pkgver.tar.bz2
	tthsum_dest.patch)
md5sums=('59d8a333ad607d6d1d1c830c8651ca50'
         '9a0db9185f443af4a0c7b4768796eccb')

build() {
	cd $srcdir/$pkgname-$pkgver
	patch -Np0 -i $startdir/tthsum_dest.patch
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
