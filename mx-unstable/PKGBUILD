# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Guenther Wutz <admin@wutzara.de>

_pkg=mx
pkgname=$_pkg-unstable
pkgver=1.3.2
pkgrel=1
pkgdesc="A widget toolkit using Clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org"
license=('LGPL')
depends=('clutter' 'dbus-glib' 'gtk2' 'startup-notification')
makedepends=('intltool' 'gobject-introspection' 'gtk-doc')
provides=("$_pkg=$pkgver")
conflicts=("$_pkg")
options=('!libtool')
source=("http://source.clutter-project.org/sources/$_pkg/${pkgver%.*}/$_pkg-$pkgver.tar.bz2")
sha256sums=('94fd2b307b204945643af1e3193a2a7be96712f9296cf0e525f5fd7538f85513')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir" install
}
