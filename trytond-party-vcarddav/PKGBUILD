# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-party-vcarddav
_pkgname=trytond_party_vcarddav
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The party_vcarddav module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("e94998f76ebddbb53b8efd9952b23677")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}