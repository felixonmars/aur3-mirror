pkgname=tornado-amqp
pkgver=0.1
pkgrel=2
pkgdesc='Async integration of py-amqplib in the tornadoweb ioloop.'
arch=('any')
url="http://code.google.com/p/tornado-amqp/"
license=('MIT')
depends=('python2>=2.6' 'python-tornado>=1.1' 'python2-amqplib>=0.6')
makedepends=('setuptools')
source=(http://tornado-amqp.googlecode.com/files/tornado-amqp-$pkgver.tar.gz)
md5sums=('6970673e99406230b629eeaaa670435c')

build() {
  cd tornado-amqp-dev-be195416efe2

  # replace /usr/bin/env python with python2
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;

  python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}
