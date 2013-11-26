# Maintainer: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-alure
_pkgname=alure
pkgver=1.2
pkgrel=3
pkgdesc='Utility library to help manage common tasks with OpenAL applications. (mingw-w64)'
arch=('any')
url='http://kcat.strangesoft.net/alure.html'
license=('MIT')
depends=('mingw-w64-openal' 'mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-libsndfile' 'mingw-w64-libvorbis' 'mingw-w64-flac' 'mingw-w64-gcc')
optdepends=('mingw-w64-libsndfile: for uncompressed audio support'
            'mingw-w64-libvorbis: for OGG Vorbis support'
            'mingw-w64-flac: for FLAC support')
options=(!strip !buildflags staticlibs)
source=("http://kcat.strangesoft.net/alure-releases/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('3088aba074ad02d95ea51e705053b9f5')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    unset LDFLAGS
    for _arch in ${_architectures}; do
        mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
        ${_arch}-cmake  -DMPG123=OFF -DDUMB=OFF -DFLUIDSYNTH=OFF \
                        ${srcdir}/${_pkgname}-${pkgver}
        make
    done
}

package() {
    for _arch in ${_architectures}; do
        cd ${srcdir}/build-${_arch}
        make DESTDIR=${pkgdir} install
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
