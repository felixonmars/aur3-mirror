# Contributor: Robson Cardoso dos Santos <cardoso.rcs@gmail.com>

pkgname=lettuce
pkgver=20101102
pkgrel=1
pkgdesc="Behaviour Driven Development (BDD) tool written in Python"
arch=(any)
url="http://lettuce.it/"
license=('GPL3')
depends=('python2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=

_gitroot="git://github.com/gabrielfalcao/lettuce.git"
_gitname="lettuce"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ]; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi  

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/build
  cp -r ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build/${_gitname} || return 1
  
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
