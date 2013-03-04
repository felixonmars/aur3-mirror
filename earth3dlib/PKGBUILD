# Maintainer: TDY <tdy@archlinux.info>

pkgname=earth3dlib
pkgver=20081202
pkgrel=1
pkgdesc="A QT widget that provides easy integration of a 3D earth model into other programs"
arch=('i686' 'x86_64')
url="http://www.earth3d.org/docs/earth3d_lib.html"
license=('GPL')
depends=('qt4')
source=(http://downloads.sourceforge.net/earth3d/$pkgname-src-SNAPSHOT.zip
        $pkgname-$pkgver-gcc44.diff)
sha256sums=('2cfc3637e93b07366df42d8a4159ea07ee9a0f80e7abd007c2208ab59dbd8db9'
            'e40f15f2737d214f4296defc627a434453798f4fe925b29dc4effb27fc8f32b1')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver-gcc44.diff
  sed -i '1i\#include <GL/glu.h>' draw/treeDrawPOISign.cpp
  qmake-qt4 $pkgname.pro QMAKE_CXXFLAGS_DEBUG+=-fpermissive
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
