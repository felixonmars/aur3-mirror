# Submitter: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgbase=python-pyqode.json
pkgname=('python-pyqode.json')
pkgver=2.6.0
_pkgver=2.6.0
pkgrel=1
arch=('any')
url="https://github.com/pyQode/pyqode.json"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/pyQode/pyqode.json/archive/${_pkgver}.tar.gz")
md5sums=('9b99e6b53c69c6758ad534590fb132f5')

build() {
   cd "$srcdir/pyqode.json-${_pkgver}"
}

package_python-pyqode.json() {
    pkgdesc="Add JSon support to pyQode"
    depends=('python'
	     'python-pyqode.qt'
	     'python-pyqode.core'
	     'python-jedi'
	     'pep8'
             'python-docutils')
    cd "$srcdir/pyqode.json-${_pkgver}"
    python3 setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "$srcdir/pyqode.json-${_pkgver}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
