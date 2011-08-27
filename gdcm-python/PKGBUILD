# Maintainer: Christofer Bertonha <chritoferbertonha@gmail.com>

pkgname=gdcm-python
pkgver=2.0.18
pkgrel=1
pkgdesc='An implementation of the DICOM standard designed to be open source so that researchers may access clinical data directly.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/mediawiki/gdcm/index.php?title=Main_Page'
license=('BSD')
depends=('python2' 'zlib' 'expat' 'swig' 'vtk')
makedepends=('cmake' 'python2' 'zlib' 'expat' 'swig' 'vtk')
provides=(gdcm)
conflicts=(gdcm)
source=("http://sourceforge.net/projects/gdcm/files/gdcm%202.x/GDCM%20${pkgver}/gdcm-${pkgver}.tar.gz")

md5sums=('3c431bac0fe4da166f2b71c78f0d37a6')

build() {
  cd ${srcdir}

  mkdir -p build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DCMAKE_C_FLAGS:STRING=-fPIC \
    -DCMAKE_CXX_FLAGS:STRING=-fPIC \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_APPLICATIONS:BOOL=ON \
    -DGDCM_USE_SYSTEM_EXPAT:BOOL=ON \
    -DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON \
    -DGDCM_USE_SYSTEM_OPENSSL:BOOL=ON \
    -DGDCM_USE_SYSTEM_POPPLER:BOOL=ON \
    -DGDCM_USE_SYSTEM_UUID:BOOL=ON \
    -DGDCM_USE_SYSTEM_ZLIB:BOOL=ON \
    -DGDCM_USE_VTK:BOOL=ON \
    -DGDCM_WRAP_PYTHON:BOOL=ON \
    ../gdcm-${pkgver}

  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install

  cd ${pkgdir}/usr/lib
  mkdir -p python2.7/site-packages

  mv gdcm{,swig}.py python2.7/site-packages
  mv vtkgdcm.py python2.7/site-packages
  mv _gdcmswig.so python2.7/site-packages
  mv *Python.so* python2.7/site-packages
}
