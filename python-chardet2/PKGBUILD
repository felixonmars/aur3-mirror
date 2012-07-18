# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=python-chardet2
pkgver=2.0.1
pkgrel=1
pkgdesc="Character encoding auto-detection in Python 3"
url="https://github.com/byroot/chardet"
makedepends=('python-distribute')
provides=('python-chardet')
conflicts=('python-chardet')
license=('LGPL')
arch=('any')
source=("http://pypi.python.org/packages/source/c/chardet2/chardet2-$pkgver.tar.gz")

build() {
    cd $srcdir/chardet2-$pkgver
    python3 setup.py build
}

package() {
    cd $srcdir/chardet2-$pkgver
    python3 setup.py install --root="$pkgdir" --optimize=1
}
sha512sums=('67c127e5c51cb8c4e0565e6bf6d50cac02bceb4bfabab01957c39df3cb69631b17a55be9e7840e9e783d8d6d663fb2ae6cef2f235dcf13c5c9b1018bbd1fcc68')
