pkgname=python2-sure
_appname=sure
pkgver=1.0.6
pkgrel=1
pkgdesc="assertion toolbox for automatic testing in python"
arch=(any)
url="https://github.com/gabrielfalcao/sure"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/s/${_appname}/${_appname}-${pkgver}.tar.gz")
md5sums=('b166a311411c4c70bb92ad2aa29e3360')

package() {
  cd "$srcdir/$_appname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

