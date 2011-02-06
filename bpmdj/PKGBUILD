# Contributor: Martin Stolpe <martinstolpe <at> googlemail dot com>

#you need to have at least alsa, oss or jack to be installed on the system
pkgname=bpmdj
pkgver=4.1
pkgrel=1
pkgdesc="Tool for detecting the BPM of mp3, ogg, m4a, mpc and flac files"
arch=('i686' 'x86_64')
url="http://bpmdj.yellowcouch.org/index.html"
license=('GPL')
depends=('fftw' 'openssl' 'qt')
makedepends=('cmake' 'gcc')
optdepends=('alsa-lib: for ALSA playback'
  'jack-audio-connection-kit: for JACK playback')
# options=()
source=(ftp://bpmdj.yellowcouch.org/bpmdj/$pkgname-$pkgver.source.tgz
  CMakeLists.txt.tar.gz
  patch2.diff
)

noextract=(CMakeLists.txt.tar.gz)

build() {
  cd "$srcdir"
  
  tar -xzf CMakeLists.txt.tar.gz -C "$srcdir/$pkgname-$pkgver"

  cd "$srcdir/$pkgname-$pkgver"

  patch -Np0 -i ../patch2.diff

  [ -d "${srcdir}/${pkgname}-${pkgver}/build" ] && rm -rf "${srcdir}/${pkgname}-${pkgver}/build"
  
  rm "${srcdir}/${pkgname}-${pkgver}/version.h"
  rm "${srcdir}/${pkgname}-${pkgver}/data-syntax.cpp"
  rm "${srcdir}/${pkgname}-${pkgver}/data-lexer.cpp"

  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build" || return 1
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1

  make DESTDIR="$pkgdir/" install
}
md5sums=('ff4795bfe1eac829a7fcf88b496311df'
         '62ae4f1a33d1d7a26b9825fa203c484e'
         '069f49ebfbd0cad116661fd9aa85975b')
