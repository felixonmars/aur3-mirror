# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-analytic-account
_pkgname=trytond_analytic_account
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The analytic_account module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-company>=3.4' 'trytond-currency>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("edeb71b81c22bd858f491bca5421643c")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}