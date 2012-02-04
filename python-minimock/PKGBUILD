# Maintainer: Markus Golser <elmargol@googlemail.com> 

pkgname=python-minimock
pkgver=1.2.7
pkgrel=1
pkgdesc="Minimock is a simple library for doing Mock objects with doctest."
arch=('any')
url="http://pypi.python.org/pypi/MiniMock"
license=('MIT')
depends=('python')
source=(
    "http://pypi.python.org/packages/source/M/MiniMock/MiniMock-$pkgver.tar.gz"
    "license.txt"
)

md5sums=('31e813667ed46b6990630a0f5bd62d94'
         '02c66efc17f9943fad46dc4fad90a60f')

build() {
  cd ${srcdir}/MiniMock-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m644 ${startdir}/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

