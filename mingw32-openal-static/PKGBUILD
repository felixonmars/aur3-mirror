# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>

pkgname=mingw32-openal-static
pkgver=1.14
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl (mingw32)"
arch=(any)
url="http://connect.creativelabs.com/openal/"
license=('GPL2')
makedepends=('mingw32-gcc' 'mingw32-w32api' 'mingw32-dx7-headers' 'cmake')
options=(!strip !buildflags)
provides=(mingw32-openal)
conflicts=(mingw32-openal)
source=(http://kcat.strangesoft.net/openal-releases/openal-soft-$pkgver.tar.bz2
        toolchain.cmake)
md5sums=('3d8b86c21a2f87a2a5e60f78f3b3f03d'
         '4ad924b32ec6b45f0e34ac39984859f3')

build() {
  cd $srcdir/openal-soft-$pkgver/build

  unset LDFLAGS

  cmake -DCMAKE_TOOLCHAIN_FILE=../../toolchain.cmake \
        -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 .. \
        -DLIBTYPE=STATIC \
        -DEXAMPLES=OFF
  make
}

package() {
  cd $srcdir/openal-soft-$pkgver/build

  make DESTDIR=${pkgdir} install
}
