# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-ccm
pkgver=2.0.2
pkgrel=1
pkgdesc="A script to easily create and destroy an Apache Cassandra cluster on localhost"
arch=('any')
url="http://github.com/pcmanus/ccm"
license=('Apache')
makedepends=('python2-setuptools')
depends=('python2' 'python2-yaml' 'python2-six' 'apache-ant' 'python2-psutil')
conflicts=('python2-ccm')
provides=('python2-ccm')
source=(http://pypi.python.org/packages/source/c/ccm/ccm-$pkgver.tar.gz)
md5sums=('4662d644049ef843fc7d04fc691fc081')

package() {
  cd $srcdir/ccm-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  mv "$pkgdir/usr/bin/ccm" "$pkgdir/usr/bin/ccm-2"
}

# vim:set ts=2 sw=2 et:
