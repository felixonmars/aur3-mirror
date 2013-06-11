# Maintainer: Alexandre Dantas <alex.dantas92@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: etienne zannelli <ezannelli@gmail.com>

pkgname=opendchub
pkgver=0.8.2
pkgrel=1
pkgdesc="Unix/Linux version of the hub software for the Direct Connect network"
arch=('i686' 'x86_64')
url="http://opendchub.sourceforge.net/"
license=('GPL2')
depends=('perl')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e812ac26323f3a8113ce1a0761ce9544')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR=$pkgdir install || return 1
  install -m755 -d $pkgdir/usr/share/doc/opendchub
  install -m644 Documentation/* $pkgdir/usr/share/doc/opendchub/
}
