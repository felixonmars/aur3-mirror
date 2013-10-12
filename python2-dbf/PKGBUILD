# Maintainer: Ishan Arora <ishanarora@gmail.com>

pkgname=python2-dbf
pkgver=0.95.004
pkgrel=1
pkgdesc="Pure python package for reading/writing dBase, FoxPro, and Visual FoxPro .dbf files (including memos)"
arch=('any')
url="https://pypi.python.org/pypi/dbf"
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/dbf/dbf-$pkgver.tar.gz")
md5sums=('e5b3436d49a2a7c1368ad061ed671f28')

package() {
  cd "$srcdir/dbf-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
