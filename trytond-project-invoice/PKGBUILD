# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-project-invoice
_pkgname=trytond_project_invoice
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The project_invoice module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-project>=3.4' 'trytond-project-revenue>=3.4' 'trytond-timesheet>=3.4' 'trytond-account>=3.4' 'trytond-account-invoice>=3.4' 'trytond-product>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("e69768e7f506b60e623b2938e6e6616c")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}