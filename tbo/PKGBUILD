# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=tbo
pkgver=1.0
pkgrel=1
pkgdesc="Easy and fun comic editor for GNOME"
arch=('i686' 'x86_64')
url="https://live.gnome.org/TBO"
license=('GPL3')
depends=('gtk3' 'librsvg')
makedepends=('intltool')
source=(http://pkgbuild.com/~bgyorgy/sources/$pkgname-$pkgver.tar.xz)
sha256sums=('e9d0d57b9e8a7f43eb721db968a84321c5ea71be560bb9da230f13475c1c3e3c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
