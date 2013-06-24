# Maintainer: Åsmund Ervik <asmunder at pvv dot org>

pkgname=python2-parameters
srcname=parameters
pkgver=0.2.0
pkgrel=1
pkgdesc="The Parameters package provides Python classes to make it easier to work with parameter sets for complex models"
url="http://neuralensemble.org/parameters"
arch=('x86_64' 'i686')
license=('CeCILL')
depends=('python2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://pypi.python.org/packages/source/p/parameters/${srcname}-${pkgver}.tar.gz")

md5sums=('61af8c655e11d4125c804a4eb98359de')
package() {
  cd "$srcdir/$srcname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
