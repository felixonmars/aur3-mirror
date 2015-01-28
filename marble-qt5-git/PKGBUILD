# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=marble-qt5-git
pkgver=v4.13.80.412.g69ab57c
pkgrel=1
pkgdesc="A Virtual Globe and World Atlas. Qt5 Build. (GIT version)"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/system/marble"
license=('GPL')
conflicts=('marble' 'kdeedu-marble')
provides=('marble')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'opencv')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'gpsd' 'quazip' 'shapelib'  'qextserialport' 'libwlocate' 'phonon-qt5')
optdepends=('gpsd: position information via gpsd'
            'quazip: reading and displaying .kmz files'
            'shapelib: reading and displaying .shp files'
            'qextserialport: eading from serial port in APRS plugin'
            'libwlocate: Position information based on neighboring WLAN networks'
            'phonon-qt5: That enables the use of audio and video content')
source=('git://anongit.kde.org/marble.git')
sha1sums=('SKIP')
install=marble-qt5-git.install

pkgver() {
  cd marble
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  sed 's|lib${LIB_SUFFIX}/plugins|lib${LIB_SUFFIX}/qt/plugins|g' -i marble/CMakeLists.txt
}

build() {
  cd build
  cmake ../marble \
    -DQT5BUILD=1 \
    -DQTONLY=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_MARBLE_EXAMPLES=YES \
    -DBUILD_MARBLE_TOOLS=YES \
    -DBUILD_MARBLE_TESTS=NO \
    -DQEXTSERIALPORT_INCLUDE_DIR=/usr/include/qt/QtExtSerialPort \
    -DQEXTSERIALPORT_LIBRARIES=/usr/lib/libQt5ExtSerialPort.so.1.2.0 \
    -DPHONON_INCLUDE_DIR=/usr/include/phonon4qt5 \
    -DPHONON_LIBRARY=/usr/lib/libphonon4qt5.so.4.8.3 \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
