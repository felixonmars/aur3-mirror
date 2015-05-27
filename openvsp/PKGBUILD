# Maintainer: Michael Hubbard <pacman@binarygrove.com>
# This PKGBUILD is maintained at https://github.com/binarygrove/aur-pkgbuild/tree/master/openvsp

pkgname=openvsp
pkgver=3.1.2
pkgrel=1
pkgdesc='A parametric aircraft geometry tool which allows the user to create a 3D model of an aircraft defined by common engineering parameters.'
arch=('x86_64' 'i686')
url='http://www.openvsp.org'
license=('NASA Open Source Agreement (NOSA) Version 1.3')
depends=('fltk' 'libxml2' 'glew')
makedepends=('cmake')
conflicts=()
provides=()
source=("https://github.com/OpenVSP/OpenVSP/archive/OpenVSP_${pkgver}.tar.gz")
sha256sums=('08e1b8c24d8ad2fabaa27d5b554cd7508be14bc8689186cc1f3336af3f1ea2fd')
         
prepare() {
    if [ -d "${srcdir}/build" ] ; then
        rm -fr "${srcdir}/build"
    fi
    
    mkdir "${srcdir}/build" 
}
         
build() {
    cd "${srcdir}/build"
    
    cmake ../OpenVSP-OpenVSP_${pkgver}/SuperProject \
        -DCMAKE_PREFIX_PATH='/usr' \
        -DVSP_USE_SYSTEM_FLTK=1 \
        -DVSP_USE_SYSTEM_GLEW=1 \
        -DVSP_USE_SYSTEM_LIBXML2=1
        
    make || return 1    
}

package() {
  cd "${srcdir}/build/OpenVSP-prefix/src/OpenVSP-build"
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/openvsp" -P cmake_install.cmake   
}
