# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=nodau
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple console based note taking program."
arch=('i686' 'x86_64')
url="http://sandbox.ltmnet.com/nodau"
license=('GPL')
depends=('sqlite3')
source=(http://sandbox.ltmnet.com/files/downloads/all/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('430731b12bbf94ac77b63c846ae8aa38')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 nodau $pkgdir/usr/bin/nodau
  install -D -m644 man/nodau.1 $pkgdir/usr/share/man/man1/nodau.1
  install -D -m644 CHANGELOG $pkgdir/usr/share/doc/$pkgname/CHANGELOG
  install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
