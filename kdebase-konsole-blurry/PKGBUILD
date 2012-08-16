# $Id: PKGBUILD 164875 2012-08-06 23:16:19Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdebase-konsole-blurry
pkgver=4.9.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Terminal patched for transparency with blur effect"
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdebase')
depends=('kdebase-runtime' 'kdebase-lib')
makedepends=('cmake' 'automoc4')
conflicts=('kdebase-konsole')
provides=('kdebase-konsole')
source=("http://download.kde.org/stable/${pkgver}/src/konsole-${pkgver}.tar.xz" "blur.patch")
sha1sums=('4ee3d7da93512788959f4d52e58d7a98c646e854'
          'e317dc2bf11d0c00abba8b7b7d0b289e11b986df')

build() {

  echo "Applying patch for transparency with blur effect"
  patch -p1 -i ../blur.patch

  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../konsole-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
