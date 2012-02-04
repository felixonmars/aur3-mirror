# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot com>

pkgname='python2-loggingext'
pkgver='0.7'
pkgrel=1
pkgdesc="Extends Python2 logging module for levelname-specific formatter definitions."
arch=('any')
url="https://github.com/kynikos/logging-extension"
license=('GPL3')
depends=('python2')
source=("https://github.com/downloads/kynikos/logging-extension/$pkgname-$pkgver.tar.gz")
md5sums=('40e73d5f98bb6f027a9d71b96b9a0f1c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
