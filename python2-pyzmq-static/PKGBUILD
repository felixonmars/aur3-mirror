# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>

pkgname=python2-pyzmq-static
pkgver=2.1.11.2
pkgrel=4
pkgdesc='zmq package that compiles its own ØMQ / 0MQ / ZeroMQ'
arch=('x86_64' 'i686')
url='https://github.com/brandon-rhodes/pyzmq-static'
license=('GPL')
depends=('python2')
conflicts=('python2-pyzmq')
source=("http://pypi.python.org/packages/source/p/pyzmq-static/pyzmq-static-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/pyzmq-static-${pkgver}"
  python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

md5sums=('05f7245ab8700d73e4eb0d57ff9efd0c')
