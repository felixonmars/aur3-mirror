# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=mmdb
pkgver=1.25.5
pkgrel=1
pkgdesc="A C++ toolkit for working with macromolecular coordinate files"
arch=('i686' 'x86_64')
url="https://launchpad.net/mmdb"
license=('LGPL')
source=(ftp://ftp.ccp4.ac.uk/opensource/$pkgname-$pkgver.tar.gz)
sha256sums=('44c614e2fa24aa492f2aa1852d2d12f440f5b1de35441cdba131db941ea3db4d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
