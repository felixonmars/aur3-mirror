# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-calendar-scheduling
_pkgname=trytond_calendar_scheduling
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The calendar_scheduling module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-calendar>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("9cd492d564727b899ae05424fdcd5041")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}