# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-calendar-classification
_pkgname=trytond_calendar_classification
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The calendar_classification module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-calendar>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("97e57c6b4fac1e9924e4516c1e9a2f8d")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}