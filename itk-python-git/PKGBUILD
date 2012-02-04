# Maintainer: Christofer Bertonha <chritoferbertonha@gmail.com>
# If no needs of all modules remove the line ITK_BUILD_ALL_MODULES below.

pkgname=itk-python-git
pkgver=20110529
pkgrel=1
pkgdesc='Insight Segmentation and Registration Toolkit (ITK).'
arch=('i686' 'x86_64')
url='http://www.itk.org/'
license=('BSD')
depends=('python2' 'zlib' 'libjpeg-turbo' 'libpng' 'libtiff' 'vtk' 'gdcm')
makedepends=('git' 'gccxml' 'cmake' 'python2' 'zlib' 'libjpeg-turbo' 'libpng' 'libtiff' 'vtk' 'gdcm')
provides=('insight-toolkit')
conflicts=('insight-toolkit')

_gitroot="git://itk.org/ITK.git"
_gitname="ITK"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    cd ..
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

   sed \
    -e 's#png_set_gray_1_2_4_to_8#png_set_expand_gray_1_2_4_to_8#g' \
    -i ${_gitname}/Modules/IO/PNG/src/itkPNGImageIO.cxx

  msg "Starting make..."

  mkdir -p build && cd build

# if our GPU have opencl or cuda enable and put below line in cmake config
#    -DITK_USE_GPU:BOOL=ON \

  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DITK_BUILD_ALL_MODULES:BOOL=ON \
    -DITK_USE_SYSTEM_GDCM:BOOL=ON \
    -DITK_USE_SYSTEM_JPEG:BOOL=ON \
    -DITK_USE_SYSTEM_PNG:BOOL=ON \
    -DITK_USE_SYSTEM_TIFF:BOOL=ON \
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON \
    -DUSE_WRAP_ITK:BOOL=ON \
    -DWRAP_ITK_PYTHON:BOOL=ON \
    -DWRAP_ITK_USE_SYSTEM_GCCXML:BOOL=ON \
    ../$_gitname

  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install
}
