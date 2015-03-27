# Maintainer: Matthew Gamble

pkgname=python-idiotscript
pkgver=1.0.0
pkgrel=1
pkgdesc="An easier, less powerful alternative to regular expressions"
arch=('any')
url='https://github.com/djmattyg007/IdiotScript'
license=('UNLICENSE')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/djmattyg007/IdiotScript/archive/$pkgver.zip")
sha256sums=("b38ccc4b1d896f0cca556b832fca3c6fdc63a8ee5288062aabee069df6e04f1c")

package() {
    cd "IdiotScript-$pkgver"
    python setup.py install --root="$pkgdir"
}
