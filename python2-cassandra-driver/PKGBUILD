# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-cassandra-driver
pkgver=2.1.2
pkgrel=1
pkgdesc="Python driver for Cassandra"
arch=('i686' 'x86_64')
url="https://github.com/datastax/python-driver"
license=('Apache')
depends=('python2' 'python2-futures' 'python2-six')
optdepends=('python2-scales' 'python2-blist' 'libev' 'python2-lz4' 'python2-python-snappy')
source=(http://pypi.python.org/packages/source/c/cassandra-driver/cassandra-driver-$pkgver.tar.gz)
md5sums=('b7b85802f5b0f830cd35b2c9564a34b6')

package() {
  cd $srcdir/cassandra-driver-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
