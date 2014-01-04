# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma-testing-git
_pkgname=qcma
pkgver=20140101
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'vitamtpmod-testing-git' 'ffmpeg')
conflicts=('qcma-git' 'qcma-kde')
source=('git://github.com/codestation/qcma.git#branch=testing')
install=qcma.install
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  # makepkg renames the git branch and we need the original name
  git checkout testing

  lrelease-qt5 resources/translations/*.ts
  qmake-qt5 PREFIX=/usr CONFIG+="GET_HASHES"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="${pkgdir}" install
}
