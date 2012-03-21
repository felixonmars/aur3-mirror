# Maintainer: Mathieu Clabaut
pkgname=python2-sqlite3dbm
_pkgname=sqlite3dbm
pkgver=0.1.4
pkgrel=1
pkgdesc="sqlite backed dictionnary"
arch=('any')
url="https://github.com/Yelp/sqlite3dbm"
license="Apache"
depends=('python2' )
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$_pkgname-$pkgver
  #patch setup.py < $startdir/setup.diff
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  # docs
}

check() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py test
}

md5sums=('fc2f8fb09a4bbc0260b97e835b369184')
