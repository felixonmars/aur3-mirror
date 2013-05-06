# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Andrei Antoukh <niwi@niwi.be>

##############################################################################
# This is a placeholder for the future Python 3 version. The AUR package was #
# merged into python2-mongokit.                                              #
##############################################################################

pkgname=python-mongokit
pkgver=0.8.3
pkgrel=1
pkgdesc="Structured schema and validation layer on top of PyMongo (Use python2-mongokit)"
arch=('any')
license=("BSD")
url="http://namlook.github.com/mongokit/"
depends=('python2' 'python2-pymongo')
conflicts=('python2-mongokit')
provides=('python2-mongokit')
source=("http://pypi.python.org/packages/source/m/mongokit/mongokit-$pkgver.tar.gz")
md5sums=('1970be8cd9a2c233f351e67067015942')

build() {
  cd "$srcdir/mongokit-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/mongokit-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s/python/python2/' {} \;
  
  install -Dm 644 "$srcdir/mongokit-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

