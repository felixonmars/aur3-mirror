# Maintainer: TDY <tdy@gmx.com>

pkgname=ithought
pkgver=a5
pkgrel=1
pkgdesc="An extensible tool for managing personal thoughts and interfacing with online journals"
arch=('i686' 'x86_64')
url="http://ithought.sourceforge.net/"
license=('GPL')
depends=('gtk' 'libxml2')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('63ab574d2b7327e9a5aed266cbeb4080')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --datadir=/usr/lib
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
