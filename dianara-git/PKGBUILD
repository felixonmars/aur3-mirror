# Maintainer: pho <pho@gatchan.org>
pkgname=dianara-git
pkgver=2931.86593a8
pkgrel=1
pkgdesc="A Qt pump.io client"
arch=( 'i686' 'x86_64')
url="https://gitlab.com/dianara/dianara-dev/"
license=('GPL')
depends=('qjson>=0.7' 'qoauth>=1.0' 'qca-ossl' 'file')
makedepends=('git' 'qconf' 'qt4')
conflicts=('dianara')
source=('dianara-git::git+https://gitlab.com/dianara/dianara-dev.git')
md5sums=('SKIP') 

pkgver() {
  cd "$srcdir/dianara-git"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/dianara-git"
  mkdir build
  cd build
  qmake-qt4 ..
  make
}

package() {
  cd "$srcdir/dianara-git/build/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
