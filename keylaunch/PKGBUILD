# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Raizen <flakeroats@hotmail.com>

pkgname=keylaunch
pkgver=1.3.9
pkgrel=1
pkgdesc="A small utility for binding commands to hot keys"
arch=('i686' 'x86_64')
url="http://www.oroborus.org/"
license=('GPL')
depends=('libx11')
source=(http://ftp.debian.org/debian/pool/main/k/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('710f68a3e7026b4139cc94ea790576c3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
