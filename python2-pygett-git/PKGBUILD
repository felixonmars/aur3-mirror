#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=python2-pygett-git
pkgver=20120602
pkgrel=1
pkgdesc="Python API binding for Ge.tt"
depends=('python2')
arch=('any')
makedepends=('git' 'python2-distribute')
install=
url="https://github.com/mrallen1/pygett"
license=('MIT')
provides=('python2-pygett')

_gitroot=git://github.com/mrallen1/pygett.git
_gitname=pygett

build() {
  PYTHON=python2

  cd "${srcdir}"

  if [ -d ${_gitname} ]; then
    cd "${_gitname}"  || return 1
    git pull origin || return 1
    cd ..
  else
    git clone ${_gitroot} || return 1
  fi

  msg "GIT checkout done or server timeout"

  cd "${srcdir}/${_gitname}"
  ${PYTHON} setup.py install --root "${pkgdir}" || return 1

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
