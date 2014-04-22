# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-ldap-connection
_pkgname=trytond_ldap_connection
pkgver=3.2.0
_pkgdir=3.2
pkgrel=1
pkgdesc="The ldap_connection module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.2')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("710f52d44325028a6aaac773bf198618")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}