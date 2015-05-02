# Submitter: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgbase=python-pyqode.qt
pkgname=('python-pyqode.qt')
pkgver=2.6.0
_pkgver=2.6.0
pkgrel=0
arch=('any')
url="https://github.com/pyQode/pyqode.qt"
license=('MIT')
pkgdesc="PyQt/PySide abstraction layer for pyqode"
depends=('python')
optdepends=('python-pyqt5: PyQt5'
            'python-pyqt4: PyQt4'
	    'python-pyside: PySide')
makedepends=('python-setuptools')
source=("https://github.com/pyQode/pyqode.qt/archive/${_pkgver}.tar.gz")
md5sums=('bdfe369d1bec260917049b912045ecad')
build() {
   cd "$srcdir/pyqode.qt-${_pkgver}"
}
package() {
    cd "$srcdir/pyqode.qt-${_pkgver}"
    python3 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 "$srcdir/pyqode.qt-${_pkgver}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
