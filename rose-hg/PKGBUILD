# Maintainer: xiannox <xian.nox@gmail.com>

pkgname=rose-hg
_pkgname=rose
pkgver=tip
pkgrel=1
pkgdesc="Simple p2p chat application"
arch=("i686" "x86_64")
url="https://bitbucket.org/celestriad/rose"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'qt5-imageformats' 'qt5-multimedia')
source=('hg+https://bitbucket.org/celestriad/rose')
install=rose.install
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  lrelease-qt5 resources/translations/*.ts
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="${pkgdir}" install
}
