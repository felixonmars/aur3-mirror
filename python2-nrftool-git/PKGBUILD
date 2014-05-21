# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='python2-nrftool-git'
_pkgname='nrftool'
pkgver=master.r2
pkgrel=1
pkgdesc='A tool to flash and erase nRF devices'
url='https://github.com/pauloborges/nrftool'
license=('MIT')
depends=('python2')
makedepends=('git')
provides=('nrftool')
arch=('any')
source=('git://github.com/pauloborges/nrftool.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo master.r$(git rev-list HEAD --count)
}

build() {
  cd "${_pkgname}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}"
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
