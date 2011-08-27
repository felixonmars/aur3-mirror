# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=construct
pkgver=2.00
pkgrel=5
pkgdesc="Python library for declarative building/parsing of data structures."
arch=('any')
url="http://construct.wikispaces.com"
license=('custom')
depends=('python')
source=(http://downloads.sourceforge.net/pyconstruct/$pkgname-$pkgver-distro.zip LICENSE.txt )
md5sums=('ac374c2fdf6a9351468ad8c149584cf3' '99d0eac39cf48a9f29f833dd3db7b214')

build() {
  install -d $pkgdir/usr/lib/python2.6/site-packages
  cp -R $srcdir/construct $pkgdir/usr/lib/python2.6/site-packages
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
