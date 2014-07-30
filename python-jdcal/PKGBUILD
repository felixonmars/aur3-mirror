# Maintainer: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>

pkgname=python-jdcal
pkgver=1.0
pkgrel=1
pkgdesc="Julian dates from proleptic Gregorian and Julian calendars."
arch=('any')
url="https://pypi.python.org/pypi/jdcal"
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/j/jdcal/jdcal-${pkgver}.tar.gz")
md5sums=('ae4a28210426f575232cb5a48d478d08')

package() {
  cd "$srcdir/jdcal-${pkgver}"

  python setup.py install --root="$pkgdir/"
}

