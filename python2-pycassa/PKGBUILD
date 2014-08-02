# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=python2-pycassa
pkgver=1.11.0
pkgrel=1
pkgdesc="pycassa is a python client library for Apache Cassandra"
arch=(any)
license=(GPL)
source="https://github.com/pycassa/pycassa/archive/v${pkgver}.tar.gz"
url="https://github.com/pycassa/pycassa"
depends=('python2' 'thrift')
md5sums=('e71543b1b6411e1ee40669dc3ad7d9b9')
provides=('pycassa')

build() {
  cd "$srcdir/pycassa-${pkgver}"
  
  # install module in vendor directories.
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
