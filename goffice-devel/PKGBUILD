# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Aaron Griffin <aaron@archlinux.org>

_pkgname=goffice
pkgname=$_pkgname-devel
pkgver=0.9.90
pkgrel=1
pkgdesc="A library of document-centric objects and utilities built on top of GLib and Gtk+ (development release)"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
options=('!libtool')
depends=('gtk3' 'libgsf' 'librsvg' 'lasem-devel')
makedepends=('intltool' 'gtk-doc')
provides=("$_pkgname=$pkgver")
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('00495483bd585b53e637c934e0dbf6c874b3f3c809e5bdedc1879093ac905c57')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static \
              --with-lasem
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
