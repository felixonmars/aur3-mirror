# Maintainer: Sebastian Wiesner <lunaryorn googlemail com>
pkgname=python-apipkg
pkgver=1.0b6
pkgrel=4
pkgdesc="Python namespace control package"
arch=('any')
url="http://bitbucket.org/hpk42/apipkg"
license=('MIT')
depends=()
source=("http://pypi.python.org/packages/source/a/apipkg/apipkg-${pkgver}.tar.gz")
md5sums=('c72c69eebedbe87df2a0534af9533159')

build() {
    cd "$srcdir/apipkg-$pkgver"
    python2 setup.py install --root="$pkgdir" -O1 || return 1
}
