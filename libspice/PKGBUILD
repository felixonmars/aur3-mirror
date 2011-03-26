# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libspice
pkgver=0.4.0
pkgrel=1
pkgdesc="Server-side library for the SPICE virtual desktop protocol"
arch=('x86_64')
url="http://www.spice-space.org"
license=('GPL')
depends=(log4cpp celt0.5.1 qcairo ffmpeg alsa-utils glut libxrandr)
makedepends=()
install=
_srcname="spice"
source=($url/download/${_srcname}_0_4.tar.bz2)
noextract=()
md5sums=('f4c3e4092e0649e7c897bd4711902630')


build() {
  cd "$srcdir/$_srcname"
  ./autogen.sh --prefix=/usr || return 1
  cd server
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
