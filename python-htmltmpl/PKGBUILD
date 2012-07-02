#Contributor: Thomas Dziedzic
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=python-htmltmpl
pkgver=1.22
pkgrel=2
pkgdesc="Templating engine for separation of code and HTML"
arch=(any)
url="http://htmltmpl.sourceforge.net/"
license=('GPL2')
depends=(python2)
makedepends=$depends
source=(http://downloads.sourceforge.net/project/htmltmpl/htmltmpl/$pkgver/htmltmpl-$pkgver.tar.gz)
md5sums=('a262f970c24c234b7fbe5ea95caf3f6b')

build() {
  cd htmltmpl-$pkgver

  python2 setup.py install --root "$pkgdir"
}
