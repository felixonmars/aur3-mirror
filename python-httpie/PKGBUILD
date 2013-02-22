# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=python-httpie
pkgver=0.4.0
pkgrel=1
pkgdesc="cURL for humans"
url="https://github.com/jkbr/httpie"
depends=('python-requests'
         'python-pygments')
makedepends=('python-distribute')
license=('BSD')
arch=('any')
source=("http://pypi.python.org/packages/source/h/httpie/httpie-$pkgver.tar.gz")

build() {
    cd $srcdir/httpie-$pkgver
    python3 setup.py build
}

package() {
    cd $srcdir/httpie-$pkgver
    python3 setup.py install --root="$pkgdir" --optimize=1
}
sha256sums=('51f423efd573e9e3c7838157500d64a187c856ca0fe951ec9abecc24cacd1dfb')
