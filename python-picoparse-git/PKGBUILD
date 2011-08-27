#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=python-picoparse-git
pkgver=20101027
pkgrel=1
pkgdesc="Small parser construction library for Python. Regular Expression free."
depends=('python2')
arch=('any')
makedepends=('git')
install=
url="http://github.com/brehaut/picoparse"
license=('BSD')
provides=('python-picoparse')
conflicts=('python-picoparse')

_gitroot=git://github.com/brehaut/picoparse.git
_gitname=picoparse

build() {
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
  python2 setup.py install --root "${pkgdir}" || return 1
}

