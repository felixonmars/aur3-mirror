# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=qtqq-git
_pkgname=Qtqq
pkgver=0.8.2alpha.225.59d63ca
pkgrel=1
pkgdesc="Yet another QQ client"
arch=('i686' 'x86_64')
url="https://github.com/zhanlangsir/Qtqq"
license=('GPL')
depends=('mpg123' 'qtwebkit')
makedepends=('git' 'cmake' 'json-glib')
 
source=("git://github.com/zhanlangsir/Qtqq.git#branch=qtqq-dev")
md5sums=('SKIP')
 
pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(awk -F"[ )]" '/version/ {print $2}' ./CMakeLists.txt | tr -d '-').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package () {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"
}
