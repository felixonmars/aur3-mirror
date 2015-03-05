# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

pkgname="python-blowfish"
pkgver=0.6.1
pkgrel=1
pkgdesc='Fast, efficient Blowfish cipher implementation in pure Python (3.4+).'
url='https://github.com/jashandeep-sohi/python-blowfish'
license=('GPL3')
source=(
 "https://pypi.python.org/packages/source/b/blowfish/blowfish-$pkgver.tar.bz2"
)
md5sums=('47d9e27f4cd19632400875b19f1ad28f')
arch=('any')
depends=('python>=3.4.0')
makedepends=('python>=3.4.0')

check() {
 cd "$srcdir/blowfish-$pkgver"
 python -m unittest test.py
}

package() {
 cd "$srcdir/blowfish-$pkgver"
 python setup.py install --root=$pkgdir
}

# vim: tabstop=1 expandtab
