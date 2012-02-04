#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python-github2-git
pkgver=20110911
pkgrel=1
pkgdesc="Github client in python, with issues support."
depends=('python2' 'python2-httplib2' 'python2-dateutil')
arch=('any')
makedepends=('git' 'python2-distribute')
install=
url="http://github.com/ask/python-github2"
license=('BSD')
provides=('python-github2')
source=()
md5sums=()

_gitroot=git://github.com/ask/python-github2.git
_gitname=python-github2

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
  $PYTHON setup.py install --root "${pkgdir}" || return 1

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
