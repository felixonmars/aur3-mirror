# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_pkgname=libgee
pkgname=${_pkgname}-0.6
pkgver=0.6.8
pkgrel=1
pkgdesc="GObject collection library"
url="http://live.gnome.org/Libgee"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(glib2)
makedepends=(gobject-introspection vala)
options=('!libtool')
source=(http://download.gnome.org/sources/libgee/0.6/libgee-${pkgver}.tar.xz)
sha256sums=('a61f8d796173d41f6144a030d4bd22461f0bb3fa18a3ebe02341b315feebf5d3')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $_pkgname-$pkgver
  # generates a bazillion traps - make sure systemd's core_pattern
  # is deactivated, or you'll DoS the journal and the system
  #make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
