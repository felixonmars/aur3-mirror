# Contributor: Filip Graliński <filipg@amu.edu.pl>
# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=libpwrutils
pkgver=20120921
pkgrel=3
pkgdesc='Basic library used in various NLP tools from Wroclaw University of Technology'
arch=('i686' 'x86_64')
url='http://nlp.pwr.wroc.pl/redmine/projects/corpus2/wiki/'
license=('LGPL')
makedepends=('cmake' 'libxml++' 'loki-lib' 'git')
depends=('boost-libs')
replaces=()
provides=()
source=()
md5sums=()

_gitroot="http://nlp.pwr.wroc.pl/corpus2.git"
_gitname="corpus2"
_gitcommit="5b8c042da30e5a3c12d7c043335743b91a5dc2b5"

build() {
  cd $srcdir
  msg "Connecting to GIT server $_gitroot"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  git checkout $_gitcommit

  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf ${srcdir}/bin
  mkdir -p ${srcdir}/bin
  cd ${srcdir}/bin || return 1

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE=/usr/bin/python2 CMAKE_BUILD_TYPE=Release ../${_gitname}

  cd libpwrutils

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
