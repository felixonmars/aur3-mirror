# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=kdeplasma-applets-rosalauncher
_pkgname=rosa-launcher
pkgver=2.1.0
_pkgver=2.1.0-0.2
pkgrel=1
epoch=1
pkgdesc="ROSA Desktop Application Launcher."
arch=('i686' 'x86_64')
url="http://rosalab.ru/"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('qjson' 'cmake' 'automoc4' 'soprano' 'baloo')
source=("http://abf-downloads.rosalinux.ru/rosa2014.1/repository/SRPMS/main/release/${_pkgname}-${_pkgver}.src.rpm")
sha256sums=('abef7238bcb8b8630535b77732b7cc4b3b2026579238a4132029c2958b191dbd')

prepare() {
  cd "${srcdir}"

  tar -xvf ${_pkgname}-${pkgver}.tar.bz2
  #patch -p0 -i "${srcdir}/rosa-launcher-2.0.0-mdvbutton.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
}

package() {
  cd "${_pkgname}-${pkgver}"/build
  
  make install DESTDIR="${pkgdir}"
}
