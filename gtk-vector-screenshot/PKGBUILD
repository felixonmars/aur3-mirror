# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gtk-vector-screenshot
pkgver=0.3.2
pkgrel=2
pkgdesc="A module to take a screenshot of a running gtk3 application as a vector image."
arch=(i686 x86_64)
url="http://www.joachim-breitner.de/projects#gtk-vector-screenshot"
license=('GPL')
depends=('gtk2' 'gtk3')
options=('!libtool')
install="$pkgname.install"
source=("http://www.joachim-breitner.de/archive/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('177e9cf7cc7d6ad2f8e81f9ac9d9e4fe')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # DSO link fix
  LIBS="-lX11" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
