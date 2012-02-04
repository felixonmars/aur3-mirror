# Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=nobug-git
pkgver=20090906
pkgrel=1
pkgdesc="A debugging library for instrumenting C and C++ programs."
arch=('i686' 'x86_64')
url="http://pipapo.org/pipawiki/NoBug"
license=('GPL')
makedepends=('git')
optdepends=('valgrind')
options=(!libtool)

_gitroot="git://git.pipapo.org/nobug"
_gitname="nobug"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  autoreconf -i
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
} 
