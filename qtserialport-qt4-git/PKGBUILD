# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Davidov Denis <mail@tux.nsk.ru>


pkgname=qtserialport-qt4-git
_gitname=qtserialport
pkgver=v5.3.2.r19.g8a7156c
pkgrel=1
pkgdesc="A high performance cross platform serial library based on the QIODevice class from the Qt framework"
arch=("i686" "x86_64")
url="https://qt.gitorious.org/qt/qtserialport"
license=("GPL")
depends=("qt4")
makedepends=("git")
provides=("qserialport")
source=("$_gitname::git+https://gitorious.org/qt/qtserialport.git")
md5sums=("SKIP")

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  qmake-qt4 qtserialport.pro
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir/" install
}
