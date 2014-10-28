# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-de-skr03
_pkgname=trytond_account_de_skr03
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_de_skr03 module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("0dd4491d9e3ce519bdb648d605bfe4f5")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}