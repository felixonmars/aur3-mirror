#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Nishit Joseph (reachjlight at gmail dot com)

pkgname=python-openpyxl
pkgver=2.0.3
pkgrel=1
pkgdesc="A Python library to read/write Excel 2007 xlsx/xlsm files, 2.x branch"
arch=('any')
url="http://openpyxl.readthedocs.org/"
license=('MIT')
depends=('python')
optdepends=('python-pillow: needed to include images')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/o/openpyxl/openpyxl-${pkgver}.tar.gz"
        "LICENCE")
md5sums=('9f04048f3fbeb857134341b9860cca40'
         'c8afe530744e932b892358e6eb5bea9b')
conflicts=('python-openpyxl1')

build() {
  cd "$srcdir"/openpyxl-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/openpyxl-${pkgver}

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}

