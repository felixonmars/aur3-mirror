# Maintainer: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=libconnman-qt-git
pkgver=20130706
pkgrel=1
pkgdesc="Qt bindings for ConnMan"
arch=('i686' 'x86_64')
url="https://github.com/nemomobile/libconnman-qt/"
license=('LGPL')
depends=('connman' 'qt5-base')
makedepends=('git')

_gitroot=https://github.com/nemomobile/libconnman-qt.git
_gitname=libconnman-qt

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  
  qmake PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/"$_gitname"
  make INSTALL_ROOT="$pkgdir" install
}
