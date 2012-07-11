# Maintainer: Christofer Bertonha <chritoferbertonha@gmail.com>

pkgname=vtk-python
mainver=5.10
pkgver=${mainver}.0
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization which supports a wide variety of visualization algorithms and advanced modeling techniques.'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
depends=('python' 'zlib' 'qt' 'libpng' 'libtiff' 'libxml2' 'expat' 'nvidia-cg-toolkit' 'boost-libs' 'libjpeg-turbo' 'tk' 'hdf5')
makedepends=('cmake' 'python' 'zlib' 'qt' 'libpng' 'libtiff' 'libxml2' 'expat' 'nvidia-cg-toolkit' 'boost' 'libjpeg-turbo' 'tk' 'hdf5')
provides=(vtk)
conflicts=(vtk)
source=("http://www.vtk.org/files/release/${mainver}/vtk-${pkgver}.tar.gz")
md5sums=('a0363f78910f466ba8f1bd5ab5437cb9')

build() {
  cd ${srcdir}

  mkdir -p build && cd build

  cmake \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DVTK_USE_BOOST:BOOL=ON \
    -DVTK_USE_CG_SHADERS:BOOL=ON\
    -DVTK_USE_QT:BOOL=ON \
    -DVTK_USE_SYSTEM_EXPAT:BOOL=ON \
    -DVTK_USE_SYSTEM_FREETYPE:BOOL=ON \
    -DVTK_USE_SYSTEM_HDF5:BOOL=ON \
    -DVTK_USE_SYSTEM_JPEG:BOOL=ON \
    -DVTK_USE_SYSTEM_LIBXML2:BOOL=ON \
    -DVTK_USE_SYSTEM_PNG:BOOL=ON \
    -DVTK_USE_SYSTEM_TIFF:BOOL=ON \
    -DVTK_USE_SYSTEM_ZLIB:BOOL=ON \
    ../VTK

  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install
  
  ln -s ${pkgdir}/usr/lib/vtk-${mainver}/*.so* ${pkgdir}/usr/lib/

  # install BSD license
  install -d ${pkgdir}/usr/share/licenses/vtk
  install -m 644 ../VTK/Copyright.txt \
    ${pkgdir}/usr/share/licenses/vtk
}
