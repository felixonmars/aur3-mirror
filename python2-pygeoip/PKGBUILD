# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python2-pygeoip
_pypiname=pygeoip
pkgver=0.3.1
pkgrel=1
pkgdesc="Pure Python GeoIP API"
arch=('any')
url='http://pypi.python.org/pypi/pygeoip'
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('geoip-database: provides a database for geoip lookups')
source=("http://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")

package() {
  cd $_pypiname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

sha512sums=('0421b160fc0d9226d69aea66bcf6a9b5b971fe80dd8d5ec743ec56178ca8ba73719c3b784e8e23c31992fb078f1f12ef2939e4301a8f11e9e407179da8e28778')
