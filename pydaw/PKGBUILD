# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=pydaw
pkgver=14.08.4
pkgrel=1
pkgdesc="All-in-one EDM-centric digital audio workstation."
arch=('i686' 'x86_64')
url="http://libmodsynth.sourceforge.net/"
license=('GPL3')
depends=('ffmpeg' 'fftw' 'liblo' 'libsamplerate' 'portmidi' 'python-numpy' 'python-pyqt4' 'python-scipy')
source=(https://github.com/j3ffhubb/pydaw/archive/pydaw4-$pkgver.tar.gz)
md5sums=('1e7c2d62e1f0900557001438383c1198')

build() {
  cd $srcdir/pydaw-pydaw4-$pkgver/src
  make
}

package() {
  cd $srcdir/pydaw-pydaw4-$pkgver/src  
  make DESTDIR=$pkgdir install
}