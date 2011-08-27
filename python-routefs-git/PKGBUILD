#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python-routefs-git
pkgver=20101027
pkgrel=1
pkgdesc="A FUSE API wrapper based on URL routing"
depends=('python2')
arch=('i686' 'x86_64')
makedepends=('git')
install=
url="http://github.com/ebroder/python-routefs"
license=('GPL', 'MPL')
provides=('routefs' 'python-routefs')
source=()
md5sums=()

_gitroot=git://github.com/ebroder/python-routefs.git
_gitname=python-routefs

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
