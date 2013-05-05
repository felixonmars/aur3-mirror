# Maintainer: Manolo Martínez <manolo@austrohungaro.com>

_pkgname=gambit
pkgname=gambit-python-git
pkgver=v0.2010.09.01.177.g7187f8a
pkgrel=1
pkgdesc="Python interface to Gambit library"
arch=('any')
url="https://github.com/gambitproject/gambit"
license=('GPL')
depends=(cython2)
optdepends=()
makedepends=('git')
provides=('')
conflicts=()
source=('git://github.com/gambitproject/gambit.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
	git describe --always | sed -e 's|-|.|g'
}

   
package() {
  cd "$srcdir/$_pkgname/src/python"
  python2 setup.py install --root="$pkgdir"
    
}
