# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgname=google-api-cpp-client
_relver=0.1
pkgver=0.1.5
pkgrel=2
pkgdesc="Open source C++ client libraries for Google APIs"
arch=('i686' 'x86_64')
url="https://github.com/google/google-api-cpp-client"
license=('Apache')
depends=('google-glog' 'gmock' 'jsoncpp' 'mongoose3')
makedepends=('cmake' 'git' 'curl' 'gflags')
provides=('google-api-cpp-client')
source=("${pkgname}-${_relver}.tar.gz::https://github.com/google/${pkgname}/archive/${_relver}.tar.gz"
	"gmock_cmake.patch")
md5sums=('16697bc872e7f3d67351227b6fced3a6'
         'c17bf19c9f244a903fea9f8ce4a439ae')
options=(staticlibs)

prepare() {
   cd "${srcdir}/${pkgname}-${_relver}"
 ## Googles CMakeLists.txt's have a few small bugs
  msg2 "Patching google's cmake"
   patch src/CMakeLists.txt < "${srcdir}/gmock_cmake.patch"
   sed -r -i 's@(GOOGLEAPIS_EXTERNAL_DEPENDENCIES_DIR )(\$\{CMAKE_BINARY_DIR\}/external_dependencies/install)@\1"\2"@' CMakeLists.txt


 ## Google uses an older version of mongoose than current. Make everything link against that 3.7 version instead of the current
 ## version, since functions needed by this libraries were removed in version 4 of mongoose
  msg2 "Patching files to use mongoose3"
   sed -r -i 's@(target_link_libraries\(googleapis_mongoose mongoose)(\))@\13\2@' ${srcdir}/${pkgname}-${_relver}/src/googleapis/client/CMakeLists.txt
   sed -r -i 's@(#include <)mongoose/(mongoose)(\.h>)@\1\23\3@' "${srcdir}/${pkgname}-${_relver}/src/googleapis/client/util/mongoose_webserver.h"
   sed -r -i 's@(check_include_file\(")mongoose/(mongoose)(\.h)@\1\23\3@' ${srcdir}/${pkgname}-${_relver}/introspect.cmake
}


build() {
   cd "${srcdir}/${pkgname}-${_relver}"

   cmake -Dgoogleapis_build_tests=OFF \
	-Dgoogleapis_build_samples=OFF \
	-Dgoogleapis_build_service_apis=OFF .
   make all
}
 
package() {
   cd "${srcdir}/${pkgname}-${_relver}"
   make install

   mkdir -pm755 "${pkgdir}"/usr/{lib,include}

   cp -r "${srcdir}/${pkgname}-${_relver}/export"/* "${pkgdir}/usr"
#   install -Dm644 "${srcdir}/${pkgname}-${_relver}/export/lib"/* "${pkgdir}/usr/lib"

}
