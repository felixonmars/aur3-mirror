# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgbase=gwenview
pkgname=gwenview-light
pkgver=15.04.0
pkgrel=1
pkgdesc="A fast and easy to use image viewer for KDE, without Baloo support"
url='http://kde.org/applications/graphics/gwenview/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kded' 'kactivities-frameworks' 'hicolor-icon-theme' 'exiv2' 'kdelibs4support' 'lcms2') # 'libkdcraw-frameworks-git' 'libkipi-frameworks-git' in the future
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python') 
optdepends=('qt5-imageformats: Plugins for additional image formats (TIFF, WEBP, RAW…)'
            'kimageformats: Plugins for additional image formats (EPS, EXR, PSD, XCF…)'
            'kipi-plugins-frameworks-git: Plugins for image modifications')
replaces=('kdegraphics-gwenview')
conflicts=('kdegraphics-gwenview' 'gwenview')
install=$pkgname.install
source=("http://download.kde.org/stable/applications/${pkgver}/src/${_pkgbase}-${pkgver}.tar.xz")
sha256sums=('4b464506f59491f95aff80c4399ae8f89f1690492b501d3fe83c7104b96f1641')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${_pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DGWENVIEW_SEMANTICINFO_BACKEND="None" \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
