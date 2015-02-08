# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgbase=qcma-qt-git
pkgname=('qcma-qt-git' 'qcma-kdenotifier-qt-git')
pkgver=v0.3.6.2.ga4662a1
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita . Qt5 (GIT version)"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
makedepends=('git' 'qt5-tools' 'qt5-base' 'vitamtpmod' 'ffmpeg' 'libnotify' 'knotifications')
conflicts=('qcma' 'qcma-kdenotifier')
provides=('qcma' 'qcma-kdenotifier')
source=('git+https://github.com/codestation/qcma.git')
install=qcma.install
md5sums=('SKIP')

pkgver() {
  cd qcma
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-qcma
  mkdir -p build-qcma-kdenotifier
}

build() {
  pushd build-qcma &> /dev/null
  lrelease-qt5 ../qcma/resources/translations/*.ts
  qmake-qt5 ../qcma/qcma.pro PREFIX=/usr
  make
  popd &> /dev/null
  pushd build-qcma-kdenotifier &> /dev/null
  qmake-qt5 ../qcma/qcma_kdenotifier.pro PREFIX="/usr"
  make
  popd &> /dev/null
}

package_qcma-qt-git() {
  pkgdesc="Content Manager Assistant for the PS Vita. Qt5 (GIT Version)"
  depends=('ffmpeg' 'qt5-base' 'libnotify' 'vitamtpmod')
  conflicts=('qcma')
  provides=('qcma')
  install=qcma.install
  make -C build-qcma INSTALL_ROOT="${pkgdir}" install
}

package_qcma-kdenotifier-qt-git() {
  pkgdesc="Content Manager Assistant for the PS Vita. Qt5 (KDE notifier) (GIT Version)"
  depends=('qcma-qt-git' 'knotifications')
  conflicts=('qcma-kdenotifier')
  provides=('qcma-kdenotifier')
  make -C build-qcma-kdenotifier INSTALL_ROOT="${pkgdir}" install
}