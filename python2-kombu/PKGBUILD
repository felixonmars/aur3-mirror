# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python2-kombu
pkgver=3.0.21
pkgrel=1
pkgdesc="AMQP Messaging Framework for Python 2.x"
arch=('any')
url="http://pypi.python.org/pypi/kombu/"
license=('custom:BSD')
depends=('python2' 'python2-anyjson')
optdepends=("python2-librabbitmq: High performance AMQP transport written in C")
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/k/kombu/kombu-$pkgver.tar.gz")
sha512sums=('341a453b0daaa50a45e490359b9b3baabdf68d9f7bd728c91daaed165a78471292dc1af1a68ffe8f1fdcf4321dca55f926f3b48d7acf11e13894a8c97d194e5d')

build() {
  cd kombu-$pkgver
  python2 setup.py build
}

package() {
  cd kombu-$pkgver
  python2 setup.py install -O1 --root="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

