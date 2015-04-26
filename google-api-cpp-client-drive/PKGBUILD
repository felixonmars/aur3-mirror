# Maintainer: Sebastian Lau <lauseb644@gmail.com>

_pkgbase=google-api-cpp-client
pkgname=google-api-cpp-client-drive
_relver=0.1
pkgver=0.1.5
pkgrel=2
pkgdesc="Open source C++ client library for Google Drive"
arch=('i686' 'x86_64')
url="https://github.com/google/google-api-cpp-client"
license=('Apache')
depends=('google-api-cpp-client')
makedepends=('cmake' 'git')
provides=('google-api-cpp-client-drive')
source=("${_pkgbase}-${_relver}.tar.gz::https://github.com/google/${_pkgbase}/archive/${_relver}.tar.gz")
md5sums=('16697bc872e7f3d67351227b6fced3a6')
options=(staticlibs)



build() {
   cd "${srcdir}/${_pkgbase}-${_relver}/service_apis/drive"
   cmake .
   make
}
 
package() {

   cd "${srcdir}/${_pkgbase}-${_relver}/service_apis/drive/google/drive_api"

   mkdir -p "${pkgdir}/usr/lib"
   mkdir -p "${pkgdir}/usr/include/google/drive_api"
   install -Dm644 libgoogle_drive_api.* "${pkgdir}/usr/lib"
   install -Dm644 *.h "${pkgdir}/usr/include/google/drive_api"
}
