# Maintainer: Sigitas Dagilis <sigidagi@gmail.com>

pkgname=minc-toolkit
pkgver=1.0.01
pkgrel=1
pkgdesc='MINC - TOOLKIT ( Medical Imaging NetCDF Toolkit )'
arch=('i686' 'x86_64')
url='http://www.nitrc.org/projects/minc-toolkit/'
license=('GPL')

depends=('perl' 'bison' 'flex' 'glut' 'libxi' 'libxmu' 'gsl' 'fftw' 'hdf5' 'netcdf' 'pcre' 'zlib' 'insight-toolkit')
makedepends=('cmake')

conflicts=()

source=('CMakeLists.patch')

_gitroot='git://github.com/BIC-MNI/minc-toolkit.git'
_gitname='minc-toolkit'
md5sums=('SKIP')
    

prepare() {
  msg "Connecting to GIT server...."
  cd "${srcdir}"
  git clone --recursive "${_gitroot}" "${_gitname}"

  msg "Patching CMakeLists.txt file."
  cp ../CMakeLists.patch "${srcdir}/${_gitname}/"
  cd "${srcdir}/${_gitname}"
  patch < CMakeLists.patch    
}

build() {
  msg "Building MINC..."  
  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_EXAMPLES:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr/local \
    -DUSE_SYSTEM_FFTW3F:BOOL=ON \
    -DUSE_SYSTEM_GSL:BOOL=ON \
    -DUSE_SYSTEM_HDF5:BOOL=ON \
    -DUSE_SYSTEM_ITK:BOOL=ON \
    -DUSE_SYSTEM_NETCDF:BOOL=ON \
    -DUSE_SYSTEM_PCRE:BOOL=ON \
    -DUSE_SYSTEM_ZLIB:BOOL=ON \
    ../"${_gitname}"

  make
}

package() {
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install
}

