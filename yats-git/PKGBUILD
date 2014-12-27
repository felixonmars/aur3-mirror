# Please submit your patch directly to:
# https://github.com/masterkorp/pkgbuilds

# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
pkgname=yats-git
_gitname=yats
pkgver=861.989e9a3
pkgrel=3
pkgdesc="Yet Another Tunning Software"
arch=("i686" "x86_64")
url="https://github.com/masterkorp/yats"
license=('GPL')
provides=("yats")
conflicts=("emstudio" "emstudio-git")
groups=()
depends=("qt4>=4.7.0" "qconf" "qwt" "qjson" "icu")
makedepends=('git')
source=("$_gitname::git+git://github.com/masterkorp/yats.git")
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
  mkdir -p "$pkgdir/etc/yats"
  install -Dm644 "core/freeems.config.json" "$pkgdir/etc/yats"
}

# vim:set ts=2 sw=2 et:
