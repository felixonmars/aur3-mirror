# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python2-parse
pkgver=1.6.4
pkgrel=1
pkgdesc='Parse strings using a specification based on the Python format() syntax.'
arch=('any')
url='http://pypi.python.org/pypi/parse'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python-parse-docs: documentation')
changelog='Changelog'
source=("http://pypi.python.org/packages/source/p/parse/parse-${pkgver}.tar.gz"
  license.txt)
md5sums=('87bfd55c25d1aea2d7499197254f3a6f'
         'db7ed26afd7dab7d5cb906e06ea68988')

build() {
  cd "$srcdir/parse-$pkgver"
  python2 setup.py build
}

check() {
  # Is there a script for this?
  cd "$srcdir/parse-$pkgver"
  python2 test_parse.py
}

package() {
  cd "parse-$pkgver"
  # license from the bottom of parse.py
  install -D -m644 "${srcdir}/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
