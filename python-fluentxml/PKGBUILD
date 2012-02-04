# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=python-fluentxml
pkgver=0.1.1
pkgrel=1
pkgdesc="XML library written in python"
arch=('any')
url="http://fluentxml.last-exile.org/"
license=('GPL3')
depends=('python')
source=("http://fluentxml.last-exile.org/sources/fluentxml-${pkgver}.tar.bz2")
md5sums=('86f0f090696c05362cbbaa085591db61')

build() {
  cd $srcdir/fluentxml-${pkgver}
  python ./setup.py install --root=$pkgdir
}
