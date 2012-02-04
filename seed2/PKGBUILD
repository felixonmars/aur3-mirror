# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkg=seed
pkgname=${_pkg}2
pkgver=2.31.91
pkgrel=1
pkgdesc="Library and interpreter for JavaScript with GObject type system bindings."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Seed/"
license=('LGPL')
options=('!libtool')
depends=('mpfr' 'libwebkit' 'gobject-introspection')
makedepends=('intltool' 'gnome-js-common')
provides=("$_pkg=$pkver")
conflicts=("$_pkg")
source=("http://ftp.gnome.org/pub/GNOME/sources/$_pkg/${pkgver%.*}/$_pkg-$pkgver.tar.bz2")
md5sums=('024aff0a69761f77bc346bbad1a2489b')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  ./configure --prefix=/usr \
              --with-webkit=1.0 \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install
}
