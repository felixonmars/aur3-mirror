# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-dunning-letter
_pkgname=trytond_account_dunning_letter
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_dunning_letter module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-account-dunning>=3.4' 'trytond-company>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("b61fded9beb9be53353a5210d96371c9")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}