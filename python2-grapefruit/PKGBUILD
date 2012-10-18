# Maintainer: Daniel Wallace < daniel.wallace at gatech dot edu>
# Contributor: Zoran Zaric <zz@zoranzaric.de>

pkgname=python2-grapefruit
pkgver=0.1a3
pkgrel=3
pkgdesc='A pure Python module that let you easily manipulate and convert color information.'
arch=(any)
url='http://code.google.com/p/grapefruit/'
license=('Apache License 2.0')
makedepends=('python2-distribute')
depends=('python2')
conflicts=('python-grapefruit')
replaces=('python-grapefruit')
source=(http://grapefruit.googlecode.com/files/grapefruit-0.1a3.tar.gz)
md5sums=('c873f0cbdaf22b0bb5c59163136db17c')

build() {
  cd "${srcdir}"

  python2 setup.py build
}

package() {
  cd "${srcdir}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
