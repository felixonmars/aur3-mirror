# $Id: $
# Maintainer: David C. Rankin <drankinatty at gmail dot com>

pkgname=wv2
pkgver=0.4.2
pkgrel=4
pkgdesc="MSWord 9,8,7,6 formats parser"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wvware/"
depends=('libgsf')
makedepends=('cmake')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/wvware/${pkgname}-${pkgver}.tar.bz2"
        'olestream.h-glib.diff'
        'buffer-overflow.patch'
        'fix-ftbfs-with-gold.patch'
        'fix-handling-empty-associatedstrings.patch'
        'fix-nan-and-inf-for-mips.patch'
        'fix-tests.patch')
license=('GPL2')
md5sums=('850ed8e44a84e7bf0610747827018cbc'
         'a35660dcababe7a2fa1c600d314aae6f'
         'c0cb420f84f4db53b5106feb58a264ce'
         '34573c38f34deeed2527636e6a01e8c5'
         '07d361d1847ed2c1bdf0079029f66d7e'
         'b4b46dddf881fc1a93a865029939d059'
         'd047fcddac4f92867f4bc698b89b4f46')

build() {
  cd ${srcdir}

  ## patch olestream.h for glib include changes
  msg "Patching olestream.h for glib include changes..."
  patch -Np0 -i olestream.h-glib.diff

  ## validate input data fix buffer-overflow http://bugs.debian.org/684078
  msg "Patching styles.cpp for buffer overflow..."
  patch -Np0 -i buffer-overflow.patch

  ## fix FTBS cause by gobject-2.0 library http://bugs.debian.org/556686
  msg "Patching CMakeLists.txt GLIB2_LIBRARIES..."
  patch -Np0 -i fix-ftbfs-with-gold.patch

  ## fix to handle empty associated strings http://bugs.debian.org/603868
  msg "Patching associatedstrings.cpp..."
  patch -Np0 -i fix-handling-empty-associatedstrings.patch

  ## fix bit patterns (mips mipsel) potentially others
  msg "Patching ustring.cpp..."
  patch -Np0 -i fix-nan-and-inf-for-mips.patch

  ## Fix testsuite to prevent encoding unknown libiconv
  msg "Patching tests/iconvtest.cpp..."
  patch -Np0 -i fix-tests.patch

  ## cflags to prevent FTBSF gsf-libxml.h:26:25: fatal error: libxml/tree.h:
  ## CMakeLists.txt is messed up and libgsf pkgconfig isn't used properly
  DCFLAGS="`pkg-config libgsf-1 --cflags`"

  mkdir -p build
  cd build

  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_C_FLAGS:STRING="$DCFLAGS" \
    -DCMAKE_CXX_FLAGS:STRING="$DCFLAGS" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
