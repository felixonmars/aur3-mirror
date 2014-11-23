# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python-ccm
pkgver=2.0
pkgrel=1
pkgdesc="A script to easily create and destroy an Apache Cassandra cluster on localhost"
arch=('any')
url="http://github.com/pcmanus/ccm"
license=('Apache')
makedepends=('python-setuptools')
depends=('python' 'python-yaml' 'python-six' 'apache-ant' 'python-psutil')
source=(http://pypi.python.org/packages/source/c/ccm/ccm-$pkgver.tar.gz)
md5sums=('8a1110d62c82a61fcde2a68d05c852fc')

package() {
  cd $srcdir/ccm-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  ln $pkgdir/usr/bin/ccm $pkgdir/usr/bin/ccm3
}

# vim:set ts=2 sw=2 et: