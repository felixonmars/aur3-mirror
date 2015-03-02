# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-company-work-time
_pkgname=trytond_company_work_time
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The company_work_time module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("bfaf4ca5aead7ff2844b391ab2e77899")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}