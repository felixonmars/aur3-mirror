# Maintainer: Viaken <viaken@gmail.com>
pkgname=paulstretch
pkgver=2.2_2
pkgrel=2
pkgver_hyph=${pkgver//_/-}
pkgdesc='A program made for extreme sound stretching of the audio (like 50x) and for applying special effects by "spectral smoothing" the sounds'
arch=('i686' 'x86_64')
url="http://hypermammut.sourceforge.net/paulstretch/"
license=('GPL')
depends=('fltk' 'fftw' 'portaudio' 'mxml' 'audiofile')
source=(http://downloads.sourceforge.net/hypermammut/$pkgname-$pkgver_hyph.tar.bz2)
md5sums=('172dec7ad316ea4df0fda6d97758c5f2')

build() {
  cd "$srcdir/$pkgname-$pkgver_hyph"

  sed -i '23i#include <string.h>' Input/MP3InputS.cpp
  sed -i '9s/-o/-lz -logg -lvorbis -o/' compile_linux_fftw.sh

  ./compile_linux_fftw.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver_hyph"

  mkdir -p "$pkgdir/usr/bin/"
  cp paulstretch "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
