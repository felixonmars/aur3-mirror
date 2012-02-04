# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=iphotoexporter
_pkgname=iPhotoExporter
pkgver=1.1
pkgrel=1
pkgdesc="This application is a very simple process to export photos stored in an iPhoto library to a tree that can be imported to any other software"
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/iPhotoExporter?content=132891'
license=('GPL')
depends=('qt')
source=("http://kde-apps.org/CONTENT/content-files/132891-${_pkgname}-${pkgver}.tar.gz")
md5sums=('7c50879dda1ff1a508122b035d72ceab')

build() {
  if [[ -d "${srcdir}/build" ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
  qmake ${srcdir}/${_pkgname}-${pkgver}/${_pkgname}.pro
  make 
}

package() {
  install -Dm 755 "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
} 
 
