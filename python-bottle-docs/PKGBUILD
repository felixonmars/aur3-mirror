# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python-bottle-docs
_pkgname=bottle
pkgver=0.12.7
pkgrel=1
pkgdesc="A set of HTML documentation for the Bottle microframework"
arch=('any')
url="http://bottlepy.org/"
license=('MIT')
options=('docs' '!strip')
makedepends=('python2-sphinx')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/defnull/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('ebb9c1dca1850cc00fdd74c255579f03')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sphinx-build2 docs html
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "$pkgdir/usr/share/doc/"
  cp -rf html "$pkgdir/usr/share/doc/python-$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
