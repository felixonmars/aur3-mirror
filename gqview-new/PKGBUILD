# Maintainer: osily <ly50247 at gmail dot com>

pkgname=gqview-new
_realname=gqview
pkgver=2.1.5
pkgrel=1
pkgdesc="An image browser and viewer"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2')
source=("http://downloads.sourceforge.net/gqview/gqview-2.1.5.tar.gz")
md5sums=("4644187d9b14b1dc11ac3bb146f262ea")
url="http://gqview.sourceforge.net"
build() {
  cd "$srcdir/$_realname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

