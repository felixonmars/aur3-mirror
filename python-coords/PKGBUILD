# Maintainer:  <clu>

pkgname=python-coords  
pkgver=0.37
pkgrel=4
pkgdesc="for managing astronomical coordinate systems"
url="https://trac6.assembla.com/astrolib"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2')
makedepends=('python2')
conflicts=()
replaces=()
backup=()
source=(http://stsdas.stsci.edu/astrolib/coords-0.37.tar.gz)
md5sums=('a2d64345b598a9c12fafb257d51ee61d')

build() {
  cd $srcdir/coords-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/coords-${pkgver}
  python2 setup.py install --root=$pkgdir/ --prefix=/usr --optimize=1
}