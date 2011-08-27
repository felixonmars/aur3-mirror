# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Raizen <flakeroats@hotmail.com>

pkgname=oroborus
pkgver=2.0.20
pkgrel=1
pkgdesc="A minimalistic window manager"
arch=('i686' 'x86_64')
url="http://www.oroborus.org/"
license=('GPL')
depends=('libxpm')
source=(http://ftp.debian.org/pool/main/o/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('deb55991da4b1c8eb7a6e7ed56040fd2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
