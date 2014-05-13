# Maintainer: Sigitas Dagilis <sigidagi@gmail.com>

pkgname=nifty_reg
pkgver=1.3.9
pkgrel=1
pkgdesc='Nifti_reg perform image analysis, rigid, affine and non-linear registration of nifti'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/niftyreg/'
license=('GPL')

depends=('doxygen' 'zlib' 'libpng')
makedepends=('cmake')

conflicts=()

source=("http://sourceforge.net/projects/niftyreg/files/nifty_reg-${pkgver}/nifty_reg-${pkgver}.zip")
md5sums=('SKIP')

#pkgver() {
    #git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
#}

build() {
  msg "Building NIfty_regs..."  
  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr/local \
    ../"${pkgname}"
  
  ccmake ../"${pkgname}"

  make
}

package() {
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install
}

