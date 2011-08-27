# Contributor: vogt <vogt.adam@gmail.com>
pkgname=darcsstats-darcs
pkgver=20090621
pkgrel=1
pkgdesc="a simple statistics generator for darcs repositories"
arch=('i686' 'x86_64')
url="http://vmiklos.hu/project/darcsstats/"
license=('GPLv2')
depends=()
makedepends=('darcs' 'gcc' 'make')
source=()
md5sums=()

_darcstrunk="http://vmiklos.hu/project/"
_darcsmod="darcsstats"

build() {
  cd $startdir/src

  msg "Checking for previous build"
  # get the sources
  if [[ -d $startdir/src/$_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
  fi

  msg "Starting build"
  cd $startdir/src/$_darcsmod

  make || return 1
  make DESTDIR=$pkgdir INSTALL='/bin/install -c' install
}
# vim:set ts=2 sw=2 et:
