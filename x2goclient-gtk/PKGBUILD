# Contributer: Richard Murri <admin@richardmurri.com>
pkgname=x2goclient-gtk
pkgver=3.01_8
_dashes=${pkgver//_/-}
pkgrel=1
pkgdesc="x2go gtk client"
arch=(i686 x86_64)
license=('GPL')
url="http://www.x2go.org"
depends=(libldap nxproxy libglademm gconfmm intltool)
source=(http://x2go.obviously-nice.de/deb/pool-lenny/${pkgname}/${pkgname}_${_dashes}.tar.gz
        x2goclient-gtk.desktop)
groups=('x2go' 'alts')

build() {
  cd "${srcdir}"

  # install desktop entry
  install -m 644 -D x2goclient-gtk.desktop "$pkgdir/usr/share/applications/x2goclient-gtk.desktop"

  cd "${pkgname}-${_dashes%-*}"

  # ugly hacks to get this to compile (this should probably be done in a better way)
  cp /usr/share/automake-1.11/config.sub .
  cp /usr/share/automake-1.11/config.guess .
  cp ./po/Makefile.in.in ./po/Makefile.in
  sed -i 's!#include <sigc++/compatibility.h>!!g' src/main_window.cc

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  install -D -m644 png/icons/128x128/x2go.png $pkgdir/usr/share/pixmaps/x2go.png

}
md5sums=('bf10d0dbad5065eb6b46883e86dbb440'
         'c199ef5634126167f70e372d1c5c6aea')
