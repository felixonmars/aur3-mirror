# Contributor: Jon Nordby <jononor@gmail.com>; David Markey <david@dmarkey.com>

pkgname=spice-client
pkgver=0.4.0
pkgrel=1
pkgdesc="Client for the SPICE virtual desktop protocol"
arch=('i686' 'x86_64')
url="http://www.spice-space.org"
license=('GPL')
depends=(log4cpp celt0.5.1 qcairo ffmpeg alsa-utils glut libxrandr)
makedepends=()
conflicts=(spice)
install=
_tarballname=spice_0_4
source=($url/download/$_tarballname.tar.bz2 remove_info.patch)
noextract=()
md5sums=('f4c3e4092e0649e7c897bd4711902630' '6e7bbc1d740a939f45f1eda39f377209')


build() {
  cd "$srcdir/spice"
  ./autogen.sh --prefix=/usr || return 1
  patch -p1 -Np1 -i ../../remove_info.patch
  cd client/x11
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
