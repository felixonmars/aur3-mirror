# Submitter: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgbase=python-pyqode.core
pkgname=('python-pyqode.core')
pkgver=2.6.5
_pkgver=2.6.5
pkgrel=0
arch=('any')
url="https://github.com/pyQode/pyqode.core"
license=('MIT')
pkgdesc="Source code editor widget for PyQt/PySide"
depends=('python'
         'python-pygments'
         'python-future'
         'python-pyqode.qt')
optdepends=('python-pyqode.python: python support'
            'python-pyqode.cobol: COBOL support'
            'python-pyqode.designer: qt designer plugins support')
makedepends=('python-setuptools')
source=("https://github.com/pyQode/pyqode.core/archive/${_pkgver}.tar.gz")
md5sums=('de6e02a25d471069d7d89ad7b1bf1b30')

build() {
   cd "$srcdir/pyqode.core-${_pkgver}"
}
package() {
    cd "$srcdir/pyqode.core-${_pkgver}"
    python3 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 "$srcdir/pyqode.core-${_pkgver}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
