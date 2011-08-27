#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python2-simplegeo-shared-git
pkgver=20110520
pkgrel=1
pkgdesc="SimpleGeo Python client library, shared components"
depends=('python2' 'python-oauth2' 'python2-httplib2' 'python2-ipaddr' 'pyutil' 'python-simplejson')
arch=('any')
makedepends=('git' 'python2-distribute')
install=
url="http://simplegeo.com"
license=('MIT')
provides=('python2-simplegeo-shared')
source=()
md5sums=()

_gitroot=https://github.com/simplegeo/python-simplegeo-shared.git
_gitname=python-simplegeo-shared

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
