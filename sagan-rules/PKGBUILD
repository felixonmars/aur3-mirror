# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
pkgname=sagan-rules
pkgver=0722010
pkgrel=1
pkgdesc="Rules package for Sagan"
arch=('any')
url="http://sagan.softwink.com/"
license=('GPL')
source=("http://sagan.softwink.com/rules/sagan-rules-07222010-r1.tar.gz")
md5sums=('70906d528de82886daae7d8df2934268')

build() {
  true
}

package() {
  cd "$srcdir/"
  mkdir -p $pkgdir/opt/sagan/rules
  install -D -m644 rules/* $pkgdir/opt/sagan/rules/
}

# vim:set ts=2 sw=2 et:
