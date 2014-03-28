# Maintainer: <kontakt.zuf@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=taglib-rcc
pkgver=1.9.1
pkgrel=1
pkgdesc="taglib with librcc patch"
arch=('i686' 'x86_64')
url="http://developer.kde.org/~wheeler/taglib.html"
depends=('gcc-libs' 'zlib' 'bash' 'libxml2' 'db' 'librcc')
makedepends=('patch' 'cmake')
license=('GPL')
provides=("taglib=$pkgver")
conflicts=("taglib")
options=('!libtool')
source=(http://taglib.github.io/releases/taglib-${pkgver}.tar.gz
	http://dside.dyndns.org/files/rusxmms/patches/taglib-csa10.tar.bz2)
md5sums=('0d35df96822bbd564c5504cb3c2e4d86'
         'e087d1bdccc7b77934f0f5617c2c5983')


build() {
  cd $srcdir/taglib-$pkgver
  [ $NOEXTRACT -eq 1 ] || patch -Np1 <$srcdir/taglib/taglib-${pkgver}-ds-rusxmms.patch || true
  [ $NOEXTRACT -eq 1 ] || sed -i 's|#include <string>|#include <string.h>|' $srcdir/taglib-$pkgver/taglib/toolkit/rccpatch.cpp

  cd ..
  mkdir build
  cd build

  [ $NOEXTRACT -eq 1 ] || cmake ../taglib-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_MP4=ON \
    -DWITH_ASF=ON
  make VERBOSE=1
}

package() {
  cd $srcdir/build
  make DESTDIR=${pkgdir} install
}
