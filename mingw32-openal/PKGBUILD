# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>

pkgname=mingw32-openal
pkgver=1.15.1
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl (mingw32)"
arch=(any)
url="http://connect.creativelabs.com/openal/"
license=('GPL2')
makedepends=('mingw32-gcc' 'mingw32-w32api' 'mingw32-dx7-headers' 'cmake')
options=(!strip !buildflags)
source=(http://kcat.strangesoft.net/openal-releases/openal-soft-$pkgver.tar.bz2
        toolchain.cmake)
sha1sums=('a0e73a46740c52ccbde38a3912c5b0fd72679ec8'
          'bd19fa7a02b4564a7887253acdebe8ca3b164d41')

build() {
  cd $srcdir/openal-soft-$pkgver/build

  unset LDFLAGS

  cmake -D CMAKE_TOOLCHAIN_FILE=../../toolchain.cmake \
        -D CMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
	-D CMAKE_BUILD_TYPE=Release \
        -D EXAMPLES=OFF \
	..
  make
}

package() {
  cd $srcdir/openal-soft-$pkgver/build

  make DESTDIR=${pkgdir} install
}
