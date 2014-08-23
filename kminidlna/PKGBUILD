
pkgname=kminidlna
pkgver=1.0
pkgrel=2
pkgdesc="kde frontend for MiniDLNA http://minidlna.sourceforge.net/with REST remote control"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/kminidlna/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'gettext' 'openssl' 'automoc4')
options=('!libtool')
source=(https://sourceforge.net/projects/kminidlna/files/${pkgname}_${pkgver}.tar.gz)
sha1sums=('53682d50ce3a46f3ac1f2de3307e91cb5acfd030')
_buildir=${srcdir}/build

build() {
  cd "${srcdir}"
	[ -d build ] && rm -rf build
  mkdir build
  cd build

  cmake "../${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr \

    sed -i '51s|"c"|"c;/usr/lib/libcrypto.so.1.0.0"|g' $srcdir/build/CMakeFiles/$(cmake --version  | sed -e 1\!d -e 's/.* \([0-9\.]\{1,6\}\)$/\1/g')/CMakeCCompiler.cmake 
  #sed -i '49s|"c"|"c;/usr/lib/libcrypto.so.1.0.0"|g' $srcdir/build/CMakeFiles/2.8.10.2/CMakeCCompiler.cmake
  sed -i '25s|<qt4/QtCore/QObject>|<QtCore/QObject>|g' $srcdir/$pkgname/src/tests/certificategeneratortest.h
  sed -i '26s|<QString>|<QtCore/QString>|g' $srcdir/$pkgname/src/tests/certificategeneratortest.h
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
