#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python2-pyrtlsdr-git
pkgver=20130309
pkgrel=1
pkgdesc="A Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
depends=('python2')
arch=('any')
makedepends=('git')
install=
url="https://github.com/roger-/pyrtlsdr"
license=('GPLv3')
provides=('pyrtlsdr' 'python2-pyrtlsdr')
source=()
md5sums=()

_gitroot=https://github.com/roger-/pyrtlsdr
_gitname=pyrtlsdr

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
