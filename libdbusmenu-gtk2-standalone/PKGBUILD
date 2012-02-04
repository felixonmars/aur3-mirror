# Maintainer: L42y <423300@gmail.com>
# Contributor: Gianfranco 'Gianfrix' Micoli <gianfrix.mg@gmail.com>
# Contributor: Chen Xiao-Long <chillermillerlong@hotmail.com>

pkgname=libdbusmenu-gtk2-standalone
_pkgname=libdbusmenu
pkgver=0.5.1
pkgrel=1
pkgdesc="A small little library that was created by pulling out some common code out of indicator-applet"
arch=('i686' 'x86_64')
url="https://launchpad.net/dbusmenu"
license=('GPL')
depends=('glib2' 'dbus-glib' 'libxml2' 'json-glib-git' 'gtk2')
makedepends=('intltool' 'gnome-doc-utils' 'vala')
provides=("libdbusmenu-gtk2=${pkgver}" "libdbusmenu=${pkgver}")
conflicts=("libdbusmenu-gtk2" "libdbusmenu")
source=("http://launchpad.net/dbusmenu/0.5/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('c6ddaee7a43c29b3f2fae20012489f12b0fe83defab547df8801ea08ba6cbeea32f2308ee82001a0d5f6ce9cd065e3c68e3369049e1e33ce10fa4811ef932174')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
  --with-gtk=2 \
  --disable-introspection \
  --disable-vala
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
