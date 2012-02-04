# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=python2-swiginac
pkgver=1.5.1
pkgrel=1
pkgdesc="Symbolic computation package (Python interface to GiNaC)"
arch=('i686' 'x86_64')
url="http://swiginac.berlios.de"
license=('GPL')
depends=('python2' 'swig' 'ginac')
provides=('swiginac')
conflicts=('swiginac')
source=(http://download2.berlios.de/swiginac/swiginac-$pkgver.tgz)
md5sums=('08a9523f1a977986fb0634ed385df738')

build() {
  cd swiginac-${pkgver}

  python2 setup.py build
}

package() {
  cd swiginac-${pkgver}

  python2 setup.py install \
    --root=${pkgdir} \
    --optimize=1
}
