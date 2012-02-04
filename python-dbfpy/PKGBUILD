# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=python-dbfpy
pkgver=2.2.4
pkgrel=1
pkgdesc="Python module for reading and writing DBF-files."
arch=(any)
url="http://dbfpy.sourceforge.net/"
license=('custom:PD')
depends=('python')
source=("http://downloads.sourceforge.net/project/dbfpy/dbfpy/$pkgver/dbfpy-$pkgver.tar.gz")
md5sums=('1462be16a2c3d9afcca55a981bf2d75d')

build() {
  cd "$srcdir/dbfpy-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
