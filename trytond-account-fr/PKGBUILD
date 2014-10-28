# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-fr
_pkgname=trytond_account_fr
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_fr module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("43fa5010d18e2115388b0ae35300940c")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}