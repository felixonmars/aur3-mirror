# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-project-revenue
_pkgname=trytond_project_revenue
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The project_revenue module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-project>=3.4' 'trytond-timesheet>=3.4' 'trytond-timesheet-cost>=3.4' 'trytond-company>=3.4' 'trytond-product>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("acef4c078422824ac7e09384e4ff7690")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}