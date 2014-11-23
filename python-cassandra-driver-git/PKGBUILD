# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python-cassandra-driver-git
pkgver=2.1.2.r5.g9a1b1f0
pkgrel=1
pkgdesc="Python driver for Cassandra"
arch=('i686' 'x86_64')
url="http://github.com/datastax/python-driver"
license=('Apache')
makedepends=('git' 'libev' 'python-setuptools')
depends=('python')
optdepends=('python-scales' 'python-blist' 'libev' 'python-lz4' 'python-python-snappy')
checkdepends=('python-nose' 'python-mock' 'python-ccm' 'python-unittest2' 'python-tox' 'python-pytz' 'python-yaml')
conflicts=('python-cassandra-driver')
provides=('python-cassandra-driver')
source=(git+https://github.com/datastax/python-driver.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/python-driver
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
    cd $srcdir/python-driver
	tox -e py34
}

package() {
  cd $srcdir/python-driver
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
