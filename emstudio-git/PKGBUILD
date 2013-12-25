# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines

# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
pkgname=emstudio-git
_gitname=emstudio
pkgver=583.ad3fd6e
pkgrel=1
pkgdesc="Cross Platform FreeEMS tuning application, written in c++ with Qt"
arch=("i686" "x86_64")
url="https://github.com/malcom2073/emstudio"
license=('GPL')
groups=()
depends=("qt4>=4.7.0" "qconf" "qwt" "qjson" "icu")
makedepends=('git')
source=("$_gitname::git+git://github.com/malcom2073/emstudio.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_gitname"

  qmake-qt4
  make
}

package() {
  cd "$_gitname"

  make INSTALL_ROOT="$pkgdir/" install
  mkdir -p "$pkgdir/etc/emstudio"
  install -Dm644 "core/freeems.config.json" "$pkgdir/etc/emstudio"
}

# vim:set ts=2 sw=2 et:
