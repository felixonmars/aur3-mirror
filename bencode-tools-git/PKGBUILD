# Author: Enverex <ben@xnode.org>

pkgname=bencode-tools-git
pkgver=20130129
pkgrel=1
pkgdesc="Bencode Tools is a collection of tools for manipulating bencoded data"
arch=('i686' 'x86_64')
url="http://zakalwe.fi/~shd/foss/bencode-tools/"
license=('GPL')
makedepends=('git')
conflict=('bencode-tools')
provides=('bencode-tools')

_gitroot="git://github.com/heikkiorsila/bencode-tools.git"
_gitname="bencode-tools"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "Local files updated."
  else
    git clone ${_gitroot} ${_gitname} --depth 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/${_gitname}"
  ./configure --package-prefix="${pkgdir}" --lib-path="/usr/lib/" --prefix="/usr/" --python=python2
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make install-c
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
