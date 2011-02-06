# Contributor: Gour <gour@gour-nitai.com>
pkgname=trytond-google-translate
_pkgname=trytond_google_translate
pkgver=1.4.0
pkgrel=2
pkgdesc="The google_translation module of the Tryton application platform"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=1.4')
makedepends=('setuptools')
source=("http://downloads.tryton.org/1.4/$_pkgname-$pkgver.tar.gz")
md5sums=('9d0b49a409a9eae5fdee20a67cf55c89')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir
}


