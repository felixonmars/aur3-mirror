# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=python2-coverage
pkgver=3.7.1
pkgrel=2
pkgdesc="A tool for measuring code coverage of Python programs."
arch=('i686' 'x86_64')
url="http://nedbatchelder.com/code/coverage/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')

source=("http://pypi.python.org/packages/source/c/coverage/coverage-$pkgver.tar.gz")
md5sums=('c47b36ceb17eaff3ecfab3bcd347d0df')

build() {
    cd "$srcdir/coverage-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/coverage-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/coverage" "$pkgdir/usr/bin/coverage2"
}
