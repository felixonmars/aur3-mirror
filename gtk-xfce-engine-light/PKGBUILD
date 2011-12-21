# Maintainer: megadriver <megadriver at gmx dot com>
# Based on gtk-xfce-engine from [extra]

pkgname=gtk-xfce-engine-light
_pkgname=gtk-xfce-engine
pkgver=2.99.0
pkgrel=1
pkgdesc="Xfce GTK2 (only) engine"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('gtk2')
makedepends=('pkgconfig')
conflicts=('gtk-xfce-engine')
provides=('gtk-xfce-engine')
options=('!libtool')
source=(http://archive.xfce.org/src/xfce/$_pkgname/2.99/$_pkgname-$pkgver.tar.bz2)
md5sums=('4ac69a7d9dc7d1acdaa0814ded1ce94d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --disable-gtk3
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
