# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Patch: SergHeart
_pkgname=python-gudev
pkgname=${_pkgname}-git
pkgver=20130305
pkgrel=2
pkgdesc="Python (PyGObject) bindings to the GUDev library"
arch=('i686' 'x86_64')
url="http://github.com/nzjrs/${_pkgname}"
license=('LGPL3')
depends=('python2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=('conduit-svn')
source=('configure.patch' 'makefile.patch')
sha1sums=('f12d3a0849205d55b43106d3bc088a89ce21d290'
          '517dd3bbe346b1627745d1dc5affc04786b16ec1')
_gitroot="git://github.com/nzjrs/${_pkgname}.git"
_gitname="${_pkgname}"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  patch -p1 -i ../configure.patch
  patch -p1 -i ../makefile.patch
  
  ./autogen.sh
  ./configure --prefix=/usr PYTHON=python2
  sed -i '/#include <pygobject\.h>/ i\
#include <python2.7/Python.h>' "${srcdir}/${_gitname}-build/gudevmodule.c"
  make || return 1
  make DESTDIR="${pkgdir}/" install
}
