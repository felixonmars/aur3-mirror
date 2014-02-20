# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
# Contributor: John Askew <john.askew@gmail.com>

pkgname=python-amqplib
pkgver=1.0.2
pkgrel=1
pkgdesc="Python client for the Advanced Message Queuing Protocol (AMQP)"
arch=('any')
url="https://code.google.com/p/py-amqplib/"
license=('LGPL')
depends=('python')
changelog=$pkgname.changelog
source=(https://py-amqplib.googlecode.com/files/amqplib-$pkgver.tgz)
md5sums=('5c92f17fbedd99b2b4a836d4352d1e2f')

build() {
  cd amqplib-$pkgver

  python setup.py build
}

package() {
  cd amqplib-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}
