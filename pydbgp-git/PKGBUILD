# Maintainer: Yerko Escalona <yescalona.at.uchile.dot.ug.dot.cl>

pkgname=pydbgp-git
pkgver=20101121
pkgrel=1
pkgdesc="A fork of Activestate's PyDBGp server."
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('git')
url="http://jabapyth.github.com/pydbgp/"
source=()
md5sums=()

_gitroot="git://github.com/jabapyth/pydbgp"
_gitname="pydbgp"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build
}

package() {
  cd ${srcdir}/${_gitname}-build
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
