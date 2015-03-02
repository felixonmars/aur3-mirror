# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-production
_pkgname=trytond_production
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The production module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company>=3.4' 'trytond-product>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("2c0fb2249eea1de0a9e651ca2e54429b")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}