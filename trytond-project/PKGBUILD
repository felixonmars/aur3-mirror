# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-project
_pkgname=trytond_project
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The project module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company-work-time>=3.4' 'trytond-party>=3.4' 'trytond-timesheet>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("e28363923b0c48827781eba5154812f5")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}