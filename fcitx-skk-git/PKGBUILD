# Maintainer: libkenta <libkenta@gmail.com>

pkgname=fcitx-skk-git
_gitname=fcitx-skk
pkgver=6.476409b
pkgrel=1
pkgdesc="Fcitx Wrapper for skk."
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-skk"
license=('GPL')
depends=('fcitx-git' 'libskk')
makedepends=('git' 'cmake' 'intltool')
conflicts=('fcitx-skk')
provides=('fcitx-skk')
source=('git://github.com/fcitx/fcitx-skk/')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
  cd "$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
  cd "$_gitname"
  make DESTDIR=${pkgdir} install
}
