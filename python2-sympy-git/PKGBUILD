#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=python2-sympy-git
pkgver=20120217
pkgrel=1
pkgdesc="A Python library for symbolic mathematics."
depends=('python2' 'python2-numpy')
arch=('i686' 'x86_64')
makedepends=('git')
install=
url="http://code.google.com/p/sympy/"
license=('BSD')
provides=('python2-sympy')
conflict=('python2-sympy')

_gitroot=git://github.com/sympy/sympy.git
_gitname=sympy

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

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
