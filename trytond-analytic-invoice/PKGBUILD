# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-analytic-invoice
_pkgname=trytond_analytic_invoice
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The analytic_invoice module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-invoice>=3.4' 'trytond-analytic-account>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("a470519987b00f465d2ab8d275725255")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}