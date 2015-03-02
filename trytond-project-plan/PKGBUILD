# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-project-plan
_pkgname=trytond_project_plan
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The project_plan module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company>=3.4' 'trytond-project>=3.4' 'trytond-timesheet>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("689ec554c1e5c865b2c682c3f3efc9b3")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}