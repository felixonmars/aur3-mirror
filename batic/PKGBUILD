# Contributor: Ruben Schuller <r.schuller@orgizm.net>

pkgname=batic
pkgver=0.4
pkgrel=2
pkgdesc="Battery state trayicon with support for sysfs."
arch=('i686' 'x86_64' 'ppc')
provides=('batic')
license=('GPL')
url="https://ruben.orgizm.net/"
depends=('python2' 'wxpython')
source=('http://ruben.orgizm.net/dumpster/code/'$pkgname'-'$pkgver'.tar.gz')
md5sums=(8e427bf763def013258d0d1a1eba2ab6)

build() {
  cd $startdir/src/$pkgname
  python2 setup.py install --root=$startdir/pkg
}
