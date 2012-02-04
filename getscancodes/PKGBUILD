# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=getscancodes
pkgver=1.0
pkgrel=1
pkgdesc="A keytouch project utility to learn scancodes."
arch=('i686 x86_64')
url="http://keytouch.sourceforge.net/dl-getscancodes.php"
license=('GPL')
source=(http://downloads.sourceforge.net/project/keytouch/getscancodes/getscancodes%201.0/$pkgname-$pkgver.tar.gz)
md5sums=('0987cf3d4dcad113922755f623db9c3f')

build() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin/

  make || return 1
  cp $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/
}
