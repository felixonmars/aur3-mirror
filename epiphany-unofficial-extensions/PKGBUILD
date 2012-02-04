# Maintainer: philefou <tuxication AT gmail DOT com>
# Contributor: rob miller <funky DOT style AT gmail DOT com>
# Contributor: Stefan Stuhrs <webmaster AT sstuhr DOT dk>

pkgname=epiphany-unofficial-extensions
pkgver=1.0
pkgrel=7
pkgdesc="a collection of unofficial epiphany extensions"
url="http://www.sstuhr.dk/epiphany-extensions/"
license=('GPL')
depends=('epiphany-extensions')
arch=('i686' 'x86_64')
source=('http://docs.google.com/uc?id=0B1t4H4u3ALbHZWMwYjMyZTUtMjlhZi00Y2MyLTg2ZDItNjNkNzVhZmU5Mzcy&export=download')
md5sums=('57b268490b738b61e731064285c916fc')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/epiphany/2.29/extensions/
  install -m644 * $pkgdir/usr/lib/epiphany/2.29/extensions/
}
