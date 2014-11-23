# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-cassandra-driver-git
pkgver=2.1.2.r5.g9a1b1f0
pkgrel=1
pkgdesc="Python driver for Cassandra"
arch=('i686' 'x86_64')
url="http://github.com/datastax/python-driver"
license=('Apache')
makedepends=('git' 'libev' 'python2-setuptools')
depends=('python2' 'python2-futures' 'python2-six')
optdepends=('python2-scales' 'python2-blist' 'libev' 'python2-lz4' 'python2-python-snappy')
checkdepends=('python2-nose' 'python2-mock' 'python2-ccm' 'python2-unittest2' 'python2-tox' 'python2-pytz')
conflicts=('python2-cassandra-driver')
provides=('python2-cassandra-driver')
source=(git+https://github.com/datastax/python-driver.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/python-driver
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
    cd $srcdir/python-driver
	tox2 -e py27
}

package() {
  cd $srcdir/python-driver
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
