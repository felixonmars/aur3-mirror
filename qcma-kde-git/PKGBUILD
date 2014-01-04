# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma-kde-git
_pkgname=qcma
pkgver=20140101
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
depends=('kdebase-workspace' 'vitamtpmod-git' 'ffmpeg')
conflicts=('qcma-testing-git' 'qcma-git')
source=('git://github.com/codestation/qcma.git')
install=qcma.install
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  lrelease-qt4 resources/translations/*.ts
  qmake-qt4 PREFIX=/usr CONFIG+="ENABLE_KDE"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="${pkgdir}" install
}
