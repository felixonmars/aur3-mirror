# Contributor: Filip Graliński <filipg@amu.edu.pl>
# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=toki
pkgver=20120922
pkgrel=2
pkgdesc='Segmentation of running text into tokens and sentences'
arch=('i686' 'x86_64')
url='http://nlp.pwr.wroc.pl/redmine/projects/toki/wiki'
license=('LGPL')
makedepends=('cmake' 'git')
depends=('libpwrutils')
replaces=()
provides=()
source=(fix_foreach.patch)
md5sums=('ff7898d83073736b174bf636c2023576')

_gitroot="http://nlp.pwr.wroc.pl/toki.git"
_gitname="toki"
_gitcommit="4867043cb147849b8ac4b1ed15ba57a1a7079975"

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
  git am < ../fix_foreach.patch

  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf ${srcdir}/bin
  mkdir -p ${srcdir}/bin
  cd ${srcdir}/bin || return 1

  cmake -DCMAKE_INSTALL_PREFIX=/usr CMAKE_BUILD_TYPE=Release ../${_gitname}

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
