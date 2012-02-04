# Maintainer: Thomas Gatzweiler <thomas.gatzweiler at gmail com>
pkgname=ttris-git
pkgver=20111211
pkgrel=1
pkgdesc="A simple tetris clone."
arch=(i686 x86_64)
url="http://github.com/7h0ma5/ttris/"
license=GPL3
depends=('freeglut')
makedepends=('cmake>=2.8', 'git')

_gitroot="git://github.com/7h0ma5/ttris.git"
_gitname="ttris"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "${srcdir}/${_gitname}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make || return 1
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}