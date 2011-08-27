# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adg
pkgver=0.6.3
pkgrel=1
pkgdesc="Automatic Drawing Generation is a set of functions focused on automating the drawing of mechanical parts."
arch=(i686 x86_64)
url="http://adg.entidi.com/"
license=('GPL')
depends=('gtk2')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('a19ecd5a4b6de6523ae233388ff77201')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
