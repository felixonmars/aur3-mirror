# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ceres
pkgver=0.57
pkgrel=1
pkgdesc="A program for doing various sound effects in the frequency domain and displaying sonograms."
arch=(i686 x86_64)
url="http://archive.notam02.no/arkiv/src/"
license=('GPL')
depends=('lesstif' 'libjpeg' 'libxmu' 'jack' 'libpng' 'libxft' 'sndlib' 'pygtk-1.2')
source=("$url$pkgname-$pkgver.tar.gz"
        "Makefile")
md5sums=('a52930d81e569bb9ae52350cb42be434'
         '9a9a4f7128512f4752b34ea07a1da40e')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  # sndlib new API fix
  sed -i "s|MUS_COMPATIBLE_FORMAT|MUS_AUDIO_COMPATIBLE_FORMAT|" sndplay.c

  cp ../../Makefile .
  make test && make check && make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make INSTALLPATH="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
