# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python2-librabbitmq
pkgver=1.5.2
pkgrel=1
pkgdesc="AMQP Client using the rabbitmq-c library"
arch=("i686" "x86_64")
url="http://pypi.python.org/pypi/librabbitmq"
license=('MPL')
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/l/librabbitmq/librabbitmq-$pkgver.tar.gz")

package() {
  cd "$srcdir/librabbitmq-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}
md5sums=('842aea204fcfb5d7a541ae72d5ad38bc')
