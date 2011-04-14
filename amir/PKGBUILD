# Maintainer: Bersam <Bersam [dot] k [at] gmail>

pkgname=amir
pkgver=70
pkgrel=1
pkgdesc="Just another accounting software designed mainly for persian users"
arch=('any')
url="https://launchpad.net/amir"
license=('GPL')
depends=('python2' 'pygobject' 'pygtk' 'python2-cairo' 'python2-sqlalchemy' 'python2-tempita' 'python2-migrate')
makedepends=('bzr')
#options=(!strip)
source=(patch.patch)
md5sums=('f43ca13a499d9c7f5fa0bdf89ec6aaa0')
_bzrtrunk="lp:amir"
_bzrmod="amir"

build() {
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  patch -p1 -i patch.patch
  
  cd "${_bzrmod}"

  # python2 fix
  for file in $(find . -t f -print); do
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${file}
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' ${file}
  done

  export PYTHON="/usr/bin/python2"

  python2 setup.py install --root=$pkgdir
}
