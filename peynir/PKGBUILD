pkgname=peynir
_pkgname=Peynir
pkgver=0.7
_pkgver=0.7
pkgrel=1
pkgdesc="Suprapackage Manager for Archlinux"
arch=any
url="http://github.com/lonicera/Peynir"
license=GPL
source=('git+https://github.com/lonicera/Peynir#branch=devel')
arch=('any')
depends=('git' 'python3')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package () {
  cd "$srcdir/$_pkgname"
  python3 setup.py install --root=$pkgdir --optimize=1
}
