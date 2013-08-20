# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=amarok-utils
pkgver=2.8.0
pkgrel=1
pkgdesc="Command line utilities from the Amarok media player."
arch=("i686" "x86_64")
url="http://amarok.kde.org/"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('qt4' 'taglib-extras')
makedepends=('pkgconfig' 'automoc4' 'cmake')
source=("http://download.kde.org/stable/amarok/${pkgver}/src/amarok-${pkgver}.tar.bz2")
sha1sums=('e76ccd53c05d57f9457d74cd08c2c41383c00937')

prepare() {
  # Remove the Amazon downloader
  sed -i '/amzdownloader/d' amarok-${pkgver}/utilities/CMakeLists.txt
  # Remove shared data
  sed -i '/( data )/d' amarok-${pkgver}/CMakeLists.txt
  sed -i '/( images )/d' amarok-${pkgver}/CMakeLists.txt
  sed -i '/( shared )/d' amarok-${pkgver}/CMakeLists.txt
    
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build
}

build() {
  cd build
  cmake ../amarok-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_PLAYER=OFF
  make
}

package(){
  cd build
  make DESTDIR="${pkgdir}" install
}