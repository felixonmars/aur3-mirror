# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-party-relationship
_pkgname=trytond_party_relationship
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The party_relationship module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("84041bf6f01bb59762f77d077c7b5561")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}