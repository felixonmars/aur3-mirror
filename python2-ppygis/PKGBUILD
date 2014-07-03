# Maintainer: Gunther Schulz

pkgbase=python2-ppygis
pkgname=('python2-ppygis')
pkgver=0.2
pkgrel=1
pkgdesc="PPyGIS is an extension the Psycopg, a PostgreSQL database adapter for the Python programming language. "
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/PPyGIS"
license=('BSD')
makedepends=('python2-psycopg2')
source=(https://pypi.python.org/packages/source/P/PPyGIS/PPyGIS-$pkgver.tar.gz)
md5sums=('0c90a18981a159d78558a4b9a97008f9')

#build() {
#  cd "$srcdir/PPyGIS-$pkgver"
#  sed -i 's/,PSYCOPG_DEBUG$//' setup.cfg
#}

#package_python-psycopg2() {
#  depends=('python' 'postgresql-libs>=8.4.1')
#
#  cd "$srcdir/psycopg2-$pkgver"
#  python setup.py install --root="$pkgdir"
#}

#package_python2-psycopg2() {
#  depends=('python2' 'postgresql-libs>=8.4.1')
#
#  cd "$srcdir/psycopg2-$pkgver"
#  python2 setup.py install --root="$pkgdir"
#}
package() {
    cd "$srcdir/PPyGIS-$pkgver"
    python2 setup.py install --root="$pkgdir"
}
