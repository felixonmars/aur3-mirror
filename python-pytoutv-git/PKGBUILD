# Maintainer: 
pkgname=python-pytoutv-git
pkgver="2.3.0"
pkgrel=1
pkgdesc='TOU.TV client library and user interfaces written in Python 3'
arch=('i686' 'x86_64')
url="https://github.com/bvanheu/pytoutv"
license=('')
depends=(python-crypto python-requests python-pyqt4)
makedepends=(git python-setuptools)

_gitroot="https://github.com/bvanheu/pytoutv.git"
_gitname="pytoutv"

build() {
  cd "${srcdir}"
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
  python setup.py build
}

package() {
  cd "${srcdir}/$_gitname"
  python setup.py install --root="${pkgdir}" --optimize=1
}

