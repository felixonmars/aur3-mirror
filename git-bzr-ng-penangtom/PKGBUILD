# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=git-bzr-ng-penangtom
pkgver=20110105
pkgrel=1
pkgdesc="git-bzr: a bidirectional git - bazaar gateway (penangtom branch)"
arch=('i686'  'x86_64')
url="http://github.com/penangtom/git-bzr-ng"
license=('GPL')
groups=()
depends=('git' 'bzr' 'bzr-fastimport-bzr')
makedepends=()
optdepends=()
provides=(git-bzr-ng)
conflicts=(git-bzr-ng)
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

_gitroot='http://github.com/penangtom/git-bzr-ng.git'
_gitname='git-bzr-ng'
_buildir=${_gitname}-build

build() 
{
  cd ${srcdir}
  msg 'Connecting to GIT server...'
  if [ -d ${_gitname} ]; then
     cd ${_gitname} && git pull origin
     cd ..
  else
     git clone ${_gitroot}
  fi

  msg 'GIT checkout done or server timeout.'
  if [ -d ${_buildir} ]; then
     msg 'Cleaning previous build...'
     rm -rf ${_buildir}
  fi

  git clone ${_gitname} ${_buildir}
  cd ${_buildir}

   # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
    cd ${_buildir}/
    install -d "${pkgdir}/usr/lib/git-core/"
    install  -o root -g root -m655 git-bzr ${pkgdir}/usr/lib/git-core/
}
