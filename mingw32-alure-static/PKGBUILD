# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=mingw32-alure-static
_pkgname=alure
pkgver=1.2
pkgrel=1
pkgdesc='Utility library to help manage common tasks with OpenAL applications. (mingw32)'
arch=('any')
url='http://kcat.strangesoft.net/alure.html'
license=('MIT')
depends=('mingw32-openal' 'mingw32-runtime')
makedepends=('cmake' 'mingw32-libsndfile' 'mingw32-libvorbis' 'mingw32-flac' 'mingw32-gcc')
optdepends=('mingw32-libsndfile: for uncompressed audio support'
            'mingw32-libvorbis: for OGG Vorbis support'
            'mingw32-flac: for FLAC support')
options=(!strip !buildflags)
provides=(mingw32-alure)
conflicts=(mingw32-alure)
source=("http://kcat.strangesoft.net/alure-releases/${_pkgname}-${pkgver}.tar.bz2"
        "toolchain.cmake")
md5sums=('3088aba074ad02d95ea51e705053b9f5'
         '4ad924b32ec6b45f0e34ac39984859f3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  cmake .\
      -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
      -DCMAKE_TOOLCHAIN_FILE=../toolchain.cmake \
      -DMPG123=OFF -DDUMB=OFF -DFLUIDSYNTH=OFF \
      -DBUILD_SHARED=OFF -DBUILD_EXAMPLES=OFF \
      -DSTATIC_CFLAGS="-DAL_LIBTYPE_STATIC" \
      -DDYNLOAD=OFF
  make VERBOSE=1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
