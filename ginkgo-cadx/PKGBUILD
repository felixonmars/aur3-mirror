# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=ginkgo-cadx
_realpkgname=Ginkgo_CADx
pkgver=3.6.1.1367.34
pkgrel=1
pkgdesc="Complete DICOM viewer solution"
arch=('i686' 'x86_64')
url="http://ginkgo-cadx.com/"
license=('LGPL3')
makdepends=('cmake')
depends=('dcmtk' 'glu' 'insight-toolkit' 'tcp_wrappers' 'vtk' 'wxgtk')
install="${pkgname}.install"
options=('!strip')
source=("http://downloads.sourceforge.net/project/ginkgocadx/${pkgver::5}/${pkgname/-/}-${pkgver}.tar.gz"
        "itk-4.0.patch"
        "wxgtk.patch"
        "ginkgocadx.desktop"
        "ginkgocadx.png")
md5sums=('f88dd34c103a396613ce3c0f17dc7d71'
         '966a868d3000a7ce8594bcaf470976a6'
         '588235931a435307dfdc9d1993c913f2'
         '16998d859432ab9348a9e835d0135a98'
         '1de087126d5e72ecdacc2e215601827f')

prepare() {
  [ -d build ] || mkdir build
  cd "${srcdir}/srcpkg/${pkgname/-/}-${pkgver}/src"
  patch -Np2 -i "${srcdir}/itk-4.0.patch"
  patch -Np2 -i "${srcdir}/wxgtk.patch"
}

build() {
  cd build
  unset LDFLAGS
  LDFLAGS=-L/usr/lib/dcmtk cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_LIBRARY_PATH=/usr/lib/dcmtk -DVTK_DIR=/usr "../srcpkg/${pkgname/-/}-${pkgver}/src" || true
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/ginkgocadx.desktop" "${pkgdir}/usr/share/applications/ginkgocadx.desktop"
  install -D -m644 "${srcdir}/ginkgocadx.png" "${pkgdir}/usr/share/pixmaps/ginkgocadx.png"
}

# vim:set ts=2 sw=2 et:
