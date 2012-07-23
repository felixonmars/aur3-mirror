# Maintainer: Andrew Panchenko <panchenkoac@gmail.com>

pkgname=kdescreensaver-bobs
_srcname=bobs
pkgdesc="A simple screensaver for Linux and UNIX which displays animated 'Bobs'"
url="http://software.amiga-hardware.com/$_srcname.cgi"
license=('GPL')
pkgver=0.2.3
pkgrel=1
arch=('i686' 'x86_64')
depends=('libgl' 'sdl_image')
makedepends=()
source=(http://software.amiga-hardware.com/software/${_srcname}-${pkgver}.tar.gz)
md5sums=('e57232db7456c3466ddd289f47135e7b')

build()
{
  cd ${srcdir}/${_srcname}-$pkgver
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  ./configure --prefix=/usr
  make
  make DESTDIR=${pkgdir} install
}
