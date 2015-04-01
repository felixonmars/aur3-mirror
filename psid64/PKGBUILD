# Maintainer: <h.bekel@googlemail.com>

pkgname=psid64  
pkgver=1.0
pkgrel=1 
pkgdesc="Generate C64 self extracting executables from PSID files"
url="http://psid64.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b13c1cbe1da84b4b43b290e004ef64ec')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix /usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
