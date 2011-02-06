# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=carrot
pkgver=0.10.5
pkgrel=1
pkgdesc="An AMQP messaging queue framework for Python."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/carrot/0.10.5"
license=('BSD')
depends=('python-amqplib' 'python-anyjson')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8c54d725b26bacbe304785428b448c6b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
