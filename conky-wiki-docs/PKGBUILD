# Contributor: wido <widomaker2k7@gmail.com>

pkgname=conky-wiki-docs
pkgver=20091219
pkgrel=1
pkgdesc="Documentation from wiki.conky.be"
arch=('any')
makedepends=(wget perl perl-json-xs)
url="http://wiki.conky.be/"
license=('CC-BY-3.0')
options=(docs)

build() {
  # Getting pages
  mkdir -p $pkgdir/usr/share/doc/conky-wiki/html || return 1
  $startdir/get.sh $startdir $srcdir/pages

  cp -r $srcdir/pages/* $pkgdir/usr/share/doc/conky-wiki/html/
}
