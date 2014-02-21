# Maintainer: Xeross <contact@xeross.me>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Stefan Seemayer

pkgname=python2-amqp
pkgver=1.4.3
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp/"
license=("LGPL")
depends=('python2>=2.6' 'setuptools')
source=(https://pypi.python.org/packages/source/a/amqp/amqp-${pkgver}.tar.gz)
sha256sums=('07e9147824a36a2614354d7c38aeeebbee00cbbed1206c4acd1e8bbbe24de4cb')

prepare() {
  cd amqp-${pkgver}
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;
}

package() {
  cd amqp-${pkgver}
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
}

# vim: ft=sh syn=sh
