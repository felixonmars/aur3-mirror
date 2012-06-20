#Submitter Giorgio Gilestro <giorgio@gilest.ro>
pkgname=libcamiface
pkgver=0.8.0
pkgrel=1
pkgdesc="libcamiface (“camera interface”) is a C API that provides a camera and OS independent image acquisition framework."
url="http://code.astraw.com/projects/motmot/libcamiface.html"
arch=('any')
license=('BSD')
depends=()
makedepends=('cmake')
source=(http://code.astraw.com/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('03e25e63bfd5c0065f7eaf68da6925f9')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  
  #cp /usr/share/opencv/OpenCVConfig.cmake CMakeModules/
  sed -i 's/OPENCV_LIBRARIES/OpenCV_LIBS/g' demo/CMakeLists.txt
  sed -i 's/OPENCV_INCLUDE_DIRS/OpenCV_INCLUDE_DIR/g' demo/CMakeLists.txt
  sed -i 's/pkg_check_modules(OPENCV opencv)/FIND_PACKAGE( OpenCV REQUIRED )/g' demo/CMakeLists.txt
  
  install -d build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS="-lm"
  make
  make DESTDIR="${pkgdir}" install
}
