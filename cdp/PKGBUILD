# Contributor: Christoph Neuroth <delmonico@gmx.net>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
pkgname=cdp
pkgver=0.33_13
pkgrel=3
arch=("i686" "x86_64")
pkgdesc="cdp is a console-mode CD player for linux"
url="http://cdp.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-0.33-13.tar.gz
        cdp-0.33-13-stdio-getline.patch
        cdp-0.33-13-compress.patch)
md5sums=('f5bcb1d4df3abf3369aff21efd0c8043'
         'fd5639e43f0a6b88d0c0d0833b9552f8'
         '67b6d44a1f2cc29a5ead330c167ecd7a')

build() {
  cd $srcdir/$pkgname-0.33-13
  patch -Np1 -i ${srcdir}/cdp-0.33-13-stdio-getline.patch
  patch -Np1 -i ${srcdir}/cdp-0.33-13-compress.patch
  make clean
  make
}

package() {
  cd $srcdir/$pkgname-0.33-13
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/man/man1
  make DESTDIR=$pkgdir install
}
