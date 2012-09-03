# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=glu-git
pkgver=20120903
pkgrel=1
pkgdesc=""
arch=(any)
url="http://cgit.freedesktop.org/mesa/glu"
license=('LGPL')
depends=()
makedepends=('git' 'make')

_gitroot="git://anongit.freedesktop.org/mesa/glu"
_gitname="glu"

build() {
  cd ${srcdir}
  if [ -d "${srcdir}/${_gitname}" ] ; then
cd ${_gitname}
    git pull
  else
git clone ${_gitroot}
  fi
cd ${srcdir}/${_gitname}
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=$pkgdir install
}
