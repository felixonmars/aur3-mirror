# Maintainer: Leonid Selivanov <bravebug at gmail dot com>

pkgname=python-configglue
pkgver=1.0
pkgrel=2
pkgdesc="Python library that glues together python's optparse."
arch=('any')
url="http://pypi.python.org/pypi/configglue/"
license=('BSD')
groups=()
depends=('python2' 'pyxdg')
makedepends=('setuptools')
optdepends=()
provides=('python-configglue=$pkgver')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/c/configglue/configglue-${pkgver}.tar.gz)
noextract=()
md5sums=('c9ea572dd768b39b61cd275e6d6267b1')

build() {
  cd ${srcdir}/configglue-${pkgver}
  
  python2 setup.py build
}

package() {
  cd ${srcdir}/configglue-${pkgver}
  
  python2 setup.py install --root=${pkgdir}/
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}