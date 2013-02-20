# Maintainer: Tobias Reiher <treiher at gmx dot de>
pkgname=python-charm-git
pkgver=20130220
pkgrel=1
pkgdesc="A Rapid Framework for Prototyping Cryptosystems"
arch=('i686' 'x86_64')
url="http://charm-crypto.com/"
license=('LGPL')
depends=(pbc python-pyparsing)
makedepends=(git wget python-sphinx)
provides=(python-charm)
conflicts=(python-charm)

_gitroot="git://github.com/JHUISI/charm.git"
_gitname="charm"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
     cd $_gitname && git pull --depth=1 origin
     msg "The local files are updated."
  else
    git clone --branch=master --depth=1 $_gitroot $_gitname
  fi  

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  ./configure.sh --prefix=/usr
  make build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
