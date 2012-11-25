# Contributor: Devaev Maxim <mdevaev@gmail.com>

pkgname=('python26-decorator')
pkgver=3.3.3
pkgrel=1
pkgdesc='Python Decorator module'
arch=('any')
url='http://pypi.python.org/pypi/decorator'
license=('BSD')
depends=('python26')
makedepends=('python26')
source=("http://pypi.python.org/packages/source/d/decorator/decorator-${pkgver}.tar.gz")
md5sums=('f5a0227cb1c34a0e7d5b7f9cd2ae3135')

build() {
  cd "$srcdir/decorator-$pkgver"
  python2.6 setup.py install --root="${pkgdir}" --optimize=1
}

