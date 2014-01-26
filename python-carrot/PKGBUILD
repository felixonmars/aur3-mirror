# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Marco Elver <marco.elver AT gmail.com>
# Maintainer : Jacob Melton <jmelton116@gmail.com>

pkgname=python-carrot
pkgver=0.10.7
pkgrel=1
pkgdesc="AMQP Messaging Framwork for Python"
arch=('any')
url='http://pypi.python.org/pypi/carrot/0.10.7'
license=('BSD')
depends=('python' 'python-amqplib')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/c/carrot/carrot-$pkgver.tar.gz")
options=(!emptydirs)

package() {
  cd ${srcdir}/carrot-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}

md5sums=('530a0614de3a669314c3acd4995c54d5')
