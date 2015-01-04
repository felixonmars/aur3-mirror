# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kaqaz-git
pkgver=172.5d8134f
pkgrel=1
pkgdesc="Gorgeous and powerful cross-platform Note application written in Qt5."
arch=('i686' 'x86_64')
url="http://labs.sialan.org/projects/kaqaz"
license=('GPL3')
depends=('qt5-location' 'qt5-multimedia')
makedepends=('git')
source=('git+https://github.com/sialan-labs/kaqaz/')
md5sums=('SKIP')

prepare() {
  cd $srcdir/kaqaz
  qmake-qt5 -r BUILD_MODE+=release BUILD_MODE+=pro
}

package() {
  cd $srcdir/kaqaz
  make INSTALL_ROOT=$pkgdir install
}

pkgver() {
  cd $srcdir/kaqaz
  echo $(git rev-list --count master).$(git rev-parse --short master)
}