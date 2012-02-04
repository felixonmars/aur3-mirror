# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=hypermammut
pkgver=0.0.1
pkgrel=1
pkgdesc="Transforms the images and the sounds using single FFT (or DCT/DST,etc)."
arch=(i686 x86_64)
url="http://hypermammut.sourceforge.net/"
license=('GPL')
depends=('wxgtk' 'imagemagick' 'libjpeg' 'audiofile' 'fftw')
makedepends=('scons')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('483fcbd63300641847d16fb36c5eeca6')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  # scons script fixes
  sed -e "s!wx-config --libs!&|sed \\\"s|-Wl,--as-needed||\\\"!" \
      -e "s|macros|& -I/usr/include/ImageMagick|" \
      -e "s|--ldflags||" \
      -i SConstruct

  # fix wrong cast
  sed -i "s|(int)this|\*((int \*)this)|" Process/Generator/Random.cpp

  # include missing wxwidget header
  sed -i "25i#include <wx/button.h>" UI/ParametersDialog.cpp

  scons
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  install -Dm755 test_s2i2s "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
