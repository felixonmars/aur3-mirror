# Maintainer: anekos <anekos@snca.net>
pkgname=cmigemo-hg
pkgver=20120921
pkgrel=1
pkgdesc="C/Migemo - Migemo library implemented in C"
url="http://www.kaoriya.net/"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
optdepends=()
makedepends=('mercurial' 'nkf')
conflicts=('cmigemo')
replaces=()
backup=()

source=('configure.patch')
md5sums=('0f163e24a93bdc3694475b284393fd4b')

_reposroot="https://code.google.com/p/cmigemo/"
_reposname="cmigemo"

build () {
  cd $srcdir

  if [ -d "$_reposname" ]
  then
    cd $_reposname && hg revert --all && hg pull -u
  else
    hg clone $_reposroot && cd $_reposname
  fi

  patch < ../../configure.patch

  ./configure && make gcc && make gcc-dict
}

package () {
  cd $srcdir/$_reposname
  make gcc-install prefix=${pkgdir}/usr docdir=${pkgdir}/usr/share/doc/migemo
}

# vim:set ts=2 sw=2 et:
