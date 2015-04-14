# $Id: PKGBUILD 235850 2015-04-09 18:45:20Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking-nognome
pkgver=2.44.0
pkgrel=1
pkgdesc="Network-related giomodules for glib without gnome proxy setting support"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates)
makedepends=(intltool)
provides=(glib-networking)
conflicts=(glib-networking)
install=glib-networking.install
source=(http://download.gnome.org/sources/${pkgname%-nognome}/${pkgver:0:4}/${pkgname%-nognome}-$pkgver.tar.xz)
sha256sums=('8f8a340d3ba99bfdef38b653da929652ea6640e27969d29f7ac51fbbe11a4346')

build() {
  cd ${pkgname%-nognome}-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/${pkgname%-nognome} --disable-static --without-gnome-proxy \
    --disable-installed-tests
  make
}

check() {
  cd ${pkgname%-nognome}-$pkgver
  make -j1 -k check
}

package() {
  cd ${pkgname%-nognome}-$pkgver
  make DESTDIR="$pkgdir" install testfiles_DATA=
}

# vim:set ts=2 sw=2 et:
