# Maintainer: Andrew Panchenko <pacnchenkoac@gmail.com>

pkgname=kdescreensaver-solarsystem-0.2
_srcname=solarsystem
pkgdesc="A screensaver for Linux and UNIX that displays the planets of the Solar System (inc Pluto)."
url="http://software.amiga-hardware.com/$_srcname.cgi"
license=('GPL')
pkgver=0.2
pkgrel=1
arch=('i686' 'x86_64')
depends=('libgl' 'sdl_image')
makedepends=()
source=(http://software.amiga-hardware.com/software/${_srcname}-${pkgver}.tar.gz)
md5sums=('580bc81126b2d3d2b77736a6e9b0e522')

build()
{
  cd ${srcdir}/${_srcname}-$pkgver
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  ./configure --prefix=/usr
  make
  make DESTDIR=${pkgdir} install
}
