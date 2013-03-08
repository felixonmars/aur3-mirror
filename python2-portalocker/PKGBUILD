# Maintainer: Francesco Marella <francesco.marella@anche.no>
# Original contribution by: FileRock team

pkgname=python2-portalocker
_pkgname=portalocker
pkgver=0.3
pkgrel=1
pkgdesc="A library to provide an easy API to file locking."
arch=('any')
url="https://github.com/WoLpH/portalocker"
license=('custom')
depends=('python2')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")

md5sums=('887d5d66ae57fda46147b53c49518954')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
}
