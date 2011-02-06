# Maintainer: Zoran Zaric <zz@zoranzaric.de>

pkgname=python-grapefruit
pkgver=0.1a3
pkgrel=2
pkgdesc='A pure Python module that let you easily manipulate and convert color information.'
arch=(any)
url='http://code.google.com/p/grapefruit/'
license=('Apache License 2.0')
makedepends=('setuptools')
depends=('python')
source=(http://grapefruit.googlecode.com/files/grapefruit-0.1a3.tar.gz)
md5sums=('c873f0cbdaf22b0bb5c59163136db17c')

build() {
  cd "${srcdir}"

  python setup.py -q build
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
