# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python-cassandra-driver
pkgver=2.1.2
pkgrel=1
pkgdesc="Python driver for Cassandra"
arch=('i686' 'x86_64')
url="https://github.com/datastax/python-driver"
license=('Apache')
depends=('python' 'python-six')
optdepends=('python-scales' 'python-blist' 'libev' 'python-lz4' 'python-python-snappy')
source=(http://pypi.python.org/packages/source/c/cassandra-driver/cassandra-driver-$pkgver.tar.gz)
md5sums=('b7b85802f5b0f830cd35b2c9564a34b6')

package() {
  cd $srcdir/cassandra-driver-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
