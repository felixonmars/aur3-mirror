# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot com>

pkgname='python-loggingext'
pkgver='0.7'
pkgrel=1
pkgdesc="Extends Python logging module for levelname-specific formatter definitions."
arch=('any')
url="https://github.com/kynikos/logging-extension"
license=('GPL3')
depends=('python')
source=("https://github.com/downloads/kynikos/logging-extension/$pkgname-$pkgver.tar.gz")
md5sums=('93632257f839ebeacc48291490d884ea')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
