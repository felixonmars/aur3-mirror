# Contributor: Frank Smit <frank/61924/nl>
pkgname=python2-momoko
pkgver=0.1.0
pkgrel=1
pkgdesc="Asynchronous Psycopg wrapper for Tornado."
arch=(any)
url="http://pypi.python.org/pypi/Momoko"
license=("BSD")
depends=("python2" "python-tornado-git" "python2-psycopg2")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/M/Momoko/Momoko-$pkgver.tar.gz")
md5sums=("07581a683a2498c629fefaf005887e3c")

build() {
    cd $srcdir/Momoko-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
