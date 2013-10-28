# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-freealut
pkgver=1.1.0
pkgrel=5
pkgdesc="OpenAL Utility Toolkit (mingw-w64)"
arch=('any')
url="http://www.openal.org"
license=("LGPL")
depends=('mingw-w64-crt' 'mingw-w64-openal')
makedepends=('mingw-w64-gcc' 'mingw-w64-openal')
options=('staticlibs' '!buildflags' '!strip')
#source=("http://connect.creativelabs.com/openal/Downloads/ALUT/freealut-$pkgver.tar.gz")
source=("ftp://ftp.spline.inf.fu-berlin.de/pub/gentoo/distfiles/freealut-$pkgver.tar.gz")
md5sums=('e089b28a0267faabdb6c079ee173664a')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/freealut-${pkgver}"
  sed -i "s|openal32|OpenAL32|g" configure.ac
  autoreconf -vfi
}

build() {
  cd "$srcdir/freealut-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/freealut-${pkgver}/build-$_arch"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

