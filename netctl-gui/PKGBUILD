# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

# comment out needed line if you dont need this component
#_use_qt5=0
#_build_gui=0
#_build_plasmoid=0

pkgname=netctl-gui
pkgver=1.0.4
pkgrel=3
pkgdesc="Qt4/Qt5 GUI for netctl. Provides a plasmoid for KDE4"
arch=('i686' 'x86_64')
url="http://arcanis.name/projects/netctl-gui"
license=('GPLv3')
depends=('netctl' 'qt5-base')
makedepends=('automoc4' 'cmake' 'qt5-tools')
optdepends=('kdebase-runtime: sudo support'
            'sudo: sudo support'
            'wpa_supplicant: wifi support')
source=("https://github.com/arcan1s/netctl-gui/releases/download/V.${pkgver}/${pkgname}-${pkgver}-src.tar.xz")
install="${pkgname}.install"
md5sums=('110dc309d0b35df8a9801ac3f4ffd931')

# flags
_cmakekeys="-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release"
if [[ ${_use_qt5} == 0 ]]; then
  _cmakekeys=${_cmakekeys}" -DUSE_QT5:BOOL=0"
  depends=('netctl' 'qt4')
  makedepends=('automoc4' 'cmake' 'desktop-file-utils' 'xdg-utils')
fi
[[ ${_build_gui} == 0 ]] && _cmakekeys=${_cmakekeys}" -DBUILD_GUI:BOOL=0"
[[ ${_build_plasmoid} == 0 ]] && _cmakekeys=${_cmakekeys}" -DBUILD_DATAENGINE:BOOL=0 -DBUILD_PLASMOID:BOOL=0" || depends+=('kdebase-workspace')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake ${_cmakekeys} "../${pkgname}"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
