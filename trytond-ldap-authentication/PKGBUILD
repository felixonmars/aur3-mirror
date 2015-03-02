# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-ldap-authentication
_pkgname=trytond_ldap_authentication
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The ldap_authentication module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("6cd38a7e464ebf963f2e69243ba4ca16")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}