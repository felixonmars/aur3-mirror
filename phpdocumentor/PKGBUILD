# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
# Maintainer: Dejan Cabrilo <dcabrilo@bitspan.rs>
pkgname=phpdocumentor
pkgver=1.4.3
pkgrel=1
arch=('any')
pkgdesc="The world standard auto-documentation tool for PHP."
url="http://www.phpdoc.org"
license="LGPL"
depends=('php')
source=("http://downloads.sourceforge.net/phpdocu/PhpDocumentor-${pkgver}.tgz")
md5sums=(180ea5bf2ab4f729d0cd09d99f7b2520)

build() {
  install -d "$pkgdir/usr/share/php"
  install -d "$pkgdir/usr/bin"
  cp -r "$srcdir/PhpDocumentor-$pkgver" "$pkgdir/usr/share/php/phpdocumentor"
  cd "$pkgdir"
  chmod +x usr/share/php/phpdocumentor/phpdoc
  ln -s  /usr/share/php/phpdocumentor/phpdoc usr/bin/phpdoc
}
