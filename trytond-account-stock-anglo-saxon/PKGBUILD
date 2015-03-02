# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-stock-anglo-saxon
_pkgname=trytond_account_stock_anglo_saxon
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_stock_anglo_saxon module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-account-invoice>=3.4' 'trytond-account-product>=3.4' 'trytond-account-stock-continental>=3.4' 'trytond-purchase>=3.4' 'trytond-sale>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("2c5843e7aba5fdf2e27588ea70d57814")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}