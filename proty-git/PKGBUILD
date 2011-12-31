# Maintainer: Thomas Gatzweiler <thomas.gatzweiler at gmail com>
pkgname=proty-git
pkgver=20111226
pkgrel=1
pkgdesc="A dynamic, prototype based programming language."
arch=(i686 x86_64)
url="http://www.proty.cc"
license=GPL3
depends=('readline')
makedepends=('cmake>=2.8', 'git')
provides=('proty')
conflicts=('proty')

_gitroot="git://github.com/proty/proty.git"
_gitname="proty"

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