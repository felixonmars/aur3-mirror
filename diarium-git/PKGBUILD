# Maintainer: Max Rosin <archlinux at maxrosin dot com>
pkgname=diarium-git
pkgver=20130331
pkgrel=1
pkgdesc="A simple journal: A place to dump your brain just one command away. Warning: under development!"
arch=('any')
url="https://github.com/fahrstuhl/diarium"
license=('BSD')
depends=('python2-appdirs')
makedepends=('git')

_gitbase="git://github.com/fahrstuhl/diarium.git"

build() {
  git clone $_gitbase ${pkgname}-${pkgver}
  cd "${srcdir}/${pkgname}-${pkgver}"
  git checkout 9ada9395d10db7f8e43e98c049a6073135db06d0
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root=${pkgdir} --install-scripts=usr/bin
}
