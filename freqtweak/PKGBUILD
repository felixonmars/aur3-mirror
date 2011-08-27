# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Gael Lane Lepine <galalep at gmail dot com>

pkgname=(freqtweak)
pkgver=0.7.2
pkgrel=1
pkgdesc="A tool for FFT-based realtime audio spectral manipulation and display"
arch=('i686' 'x86_64')
url="http://freqtweak.sourceforge.net/"
license=('GPL')
depends=('jack' 'fftw' 'wxgtk' 'libsigcpp1.2')
conflicts=('freqtweak-x86_64')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('36a2ae6d0ed836c3e187fb922c1bc6c8')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  sed '26 i#include <stdint.h>' -i src/FTutils.hpp || return 1
  sed 's_unsigned)_unsigned long)_g' -i src/FTprocOrderDialog.cpp || return 1

  ./configure --prefix=/usr --enable-float || return 1
  make || return 1
}

package() {

  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install || return 1
}