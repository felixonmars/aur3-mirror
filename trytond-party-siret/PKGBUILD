# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-party-siret
_pkgname=trytond_party_siret
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The party_siret module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("55f0a93f926105ea8d33a5173e7d1fc5")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}