# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-google-maps
_pkgname=trytond_google_maps
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The google_maps module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("5503003fdb90f0e1207c6edf83880ccb")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}