# Maintainer: Andrew Panchenko <panchenkoac@gmail.com>

pkgname=kdescreensaver-solarsystem
_srcname=solarsystem
pkgdesc="A screensaver for Linux and UNIX that displays the planets of the Solar System (inc Pluto)."
url="http://software.amiga-hardware.com/$_srcname.cgi"
license=('GPL')
pkgver=0.2.2
pkgrel=1
arch=('i686' 'x86_64')
depends=('libgl' 'sdl_image')
makedepends=()
source=(http://software.amiga-hardware.com/software/${_srcname}-${pkgver}.tar.gz)
md5sums=('54405ef46e9bd55169ab044716fb27ce')

build()
{
  cd ${srcdir}/${_srcname}-$pkgver
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  ./configure --prefix=/usr
  make
  make DESTDIR=${pkgdir} install
}
