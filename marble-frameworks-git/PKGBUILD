# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=marble-frameworks-git
pkgver=v15.03.97.104.g1d025ae
pkgrel=1
pkgdesc="Desktop Globe. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/system/marble"
license=('GPL')
provides=('marble')
conflicts=('marble' 'marble-qt' 'kdeedu-marble' )
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'opencv'  'hicolor-icon-theme' 'kparts' 'krunner' 'knewstuff')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'gpsd' 'quazip-qt5-svn' 'shapelib' 'qextserialport' 'libwlocate' 'phonon-qt5')
optdepends=('gpsd: position information via gpsd'
            'quazip-qt5-svn: reading and displaying .kmz files'
            'shapelib: reading and displaying .shp files'
            'qextserialport: eading from serial port in APRS plugin'
            'libwlocate: Position information based on neighboring WLAN networks'
            'phonon-qt5: That enables the use of audio and video content')
source=('git://anongit.kde.org/marble.git#branch=kde-frameworks-5')
sha1sums=('SKIP')
install=marble-frameworks-git.install

pkgver() {
  cd marble
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # fix installation plugins path
  sed 's|set(QT_PLUGINS_DIR ${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/plugins)|set(QT_PLUGINS_DIR ${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/qt/plugins)|g' -i marble/CMakeLists.txt

  # fix quazip-qt5 detect
  sed 's|quazip/|quazip5/|g' -i marble/src/plugins/runner/kml/KmzHandler.cpp

  # fix marblewidwet linker
  cd marble
  for i in $(grep -R '} marblewidget )' | cut -d ':' -f1); do sed 's|} marblewidget )|} ${MARBLEWIDGET} )|g' -i ${i}; done
  sed 's|marblewidget|${MARBLEWIDGET}|g' -i examples/cpp/marble-game/CMakeLists.txt
}

build() {
  cd build
  cmake ../marble \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_KF5=ON \
    -DBUILD_MARBLE_EXAMPLES=ON \
    -DBUILD_MARBLE_TOOLS=ON \
    -DBUILD_MARBLE_TESTS=OFF \
    -DMOBILE=OFF \
    -DQEXTSERIALPORT_INCLUDE_DIR=/usr/include/qt/QtExtSerialPort \
    -DQEXTSERIALPORT_LIBRARIES=/usr/lib/libQt5ExtSerialPort.so \
    -DPHONON_INCLUDE_DIR=/usr/include/phonon4qt5 \
    -DKDE_SKIP_UNINSTALL_TARGET=ON

make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  rm -fr "${pkgdir}/usr/bin/"marble-{mobile,touch}
}
