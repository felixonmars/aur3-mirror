# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=mixxx-beta
pkgver=1.10.0
pkgrel=1
pkgdesc="Free, open source DJ software"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('fftw' 'libid3tag' 'libmad' 'libshout' 'portaudio' 'portmidi' 'qtwebkit' 'taglib')
makedepends=('scons')
conflicts=('mixxx')
source=(http://downloads.mixxx.org/mixxx-1.10.0-beta1/mixxx-1.10.0-beta1-src.tar.gz)
md5sums=('c8d1565c9638c254a1f951d3011f2aa0')

build() {
  cd "$srcdir/mixxx-1.10.0-beta1"
  scons prefix=/usr qtdir=/usr/lib/qt
}

package() {
  cd "$srcdir/mixxx-1.10.0-beta1"
  scons prefix=/usr qtdir=/usr/lib/qt install_root="$pkgdir/usr" install
}
