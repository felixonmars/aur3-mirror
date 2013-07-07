# Maintainer: bwrsandman <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/enet-pp-hg

_hgrepo="enet-pp"
_hgroot="https://code.google.com/p/${_hgrepo}/"
pkgname="${_hgrepo}"-hg
pkgver=3.ecc9fc11ba9c
pkgrel=1
pkgdesc="A very lightweight C++ wrapper for the ENet networking library."
arch=('i686' 'x86_64')
url="${_hgroot}"
license=('MIT')
depends=('enet')
makedepends=('mercurial' 'qt4')
conflicts=("${_hgrepo}")
provides=("${_hgrepo}")

source=(${_hgrepo}::hg+${_hgroot} enet.patch)
md5sums=('SKIP' '25a65f245f0d4aeca45f82bd449b98f5')

pkgver() {
  cd "${_hgrepo}"
  echo "$(hg identify -n).$(hg identify -i)"
}

prepare() {
  cd "${srcdir}/${_hgrepo}"
  patch -p1 -i ../enet.patch 
}

build() {
  cd "${srcdir}/${_hgrepo}"
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${_hgrepo}"
  
  install -d -m755 "${pkgdir}"/usr/

  cp -r include "${pkgdir}"/usr

  install -d -m755 "${pkgdir}"/usr/lib
  install -m644 libENet++.a "${pkgdir}"/usr/lib
}
