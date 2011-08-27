# Maintainer: Charles Clément <caratorn at gmail dot com>
pkgname=pythonocc
pkgver=0.4
pkgrel=1
pkgdesc="3D CAD/CAE/PLM development framework for the python programming
language"
arch=('i686' 'x86_64')
url="http://www.pythonocc.org"
license=('GPL3')
depends=('python' 'opencascade' 'boost-libs')
makedepends=('swig')
optdepends=()
source=(http://download.gna.org/$pkgname/$pkgver/pythonOCC-$pkgver.tar.gz)
md5sums=('70ffae8ba2abc1fb30da808eb3fed4e2')

build() {
  cd "$srcdir/pythonOCC-$pkgver/src"

  python setup.py install --root=$pkgdir --optimize=1 \
    --with-occ-include=/opt/opencascade/inc \
    --with-occ-lib=/opt/opencascade/lib
}

# vim:set ts=2 sw=2 et:
