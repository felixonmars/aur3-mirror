# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=freeems-serialio-git
_gitname=FreeEMS-SerialIO
pkgver=98.d64c287
pkgrel=1
pkgdesc="Serial IO taylored for FreeEMS"
arch=("i686" "x86_64")
url="https://github.com/seank/FreeEMS-SerialIO"
license=('GPL')
depends=("qt4>=4.7.0")
makedepends=("git" "qconf")
source=("$_gitname::git+git://github.com/seank/FreeEMS-SerialIO.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_gitname"

  qmake-qt4 PREFIX="/usr"
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
