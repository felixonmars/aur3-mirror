# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
pkgname=lxdream
pkgver=0.9.1
pkgrel=3
pkgdesc="A linux-based emulator for the Sega Dreamcast system."
arch=('i686' 'x86_64')
url="http://www.lxdream.org/"
license=('GPL')
depends=('gtk2' 'libgl' 'sdl')
optdepends=('lirc-utils' 'libpulse')
install='lxdream.install'
changelog='lxdream.changelog'
source=("$pkgname-$pkgver.tar.gz::http://www.lxdream.org/count.php?file=$pkgname-$pkgver.tar.gz" "glib-fixes.patch")
md5sums=('cbc78bad884c773134265ab3d582bc25'
         '265367b6fba207b0071ae091b7aa426e')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix compile with recent glib.
  patch -p1 -i "${srcdir}/glib-fixes.patch"

  #for file in actparse.c gendec.c; do
    #sed -e 's|#include <glib/gstrfuncs.h>|#include <glib-2.0/glib.h>|' \
    #    -i "${srcdir}/${pkgname}-${pkgver}/src/tools/${file}"
  #done

  LIBS="-lX11 -lm" ./configure --prefix=/usr --sysconfdir=/etc --without-esd --with-sdl
  make || return 1
  #make DESTDIR="$startdir/pkg" install
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
