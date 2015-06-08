# Submitter: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgbase=python-pyqode.cobol
pkgname=('python-pyqode.cobol')
pkgver=2.6.2
_pkgver=2.6.2
pkgrel=0
arch=('any')
url="https://github.com/pyQode/pyqode.cobol"
license=('MIT')
pkgdesc="Add COBOL support to pyQode"
depends=('python'
         'python-pyqode.core')
makedepends=('python-setuptools')
source=("https://github.com/pyQode/pyqode.cobol/archive/${_pkgver}.tar.gz")
md5sums=('c0c4dccc5cc7d408504f3781d87c5463')

build() {
   cd "$srcdir/pyqode.cobol-${_pkgver}"
}
package() {
    cd "$srcdir/pyqode.cobol-${_pkgver}"
    python3 setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "$srcdir/pyqode.cobol-${_pkgver}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
