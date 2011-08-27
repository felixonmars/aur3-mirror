# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=safelua
pkgver=0.1
pkgrel=1
pkgdesc="A variant of Lua that allows creating advanced sandboxes."
arch=(any)
url="http://sourceforge.net/p/safelua/wiki/Home/"
license=('GPL')
depends=('lua')
source=("http://downloads.sourceforge.net/project/safelua/$pkgname${pkgver/.}.zip")
md5sums=('34569faeda213def2fbfbfeef14d97e4')

build() {
  # convert all DOS files to UNIX format
  sed -i "s|\r||" `find "$srcdir" -type f`
}

package() {
  cd "$srcdir/$pkgname${pkgver/.}"

  # bin
  install -d "$pkgdir/usr/bin"
  sed "1i#!/usr/bin/env lua" $pkgname.lua > \
      "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # examples and readme
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 examples/* "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 readme.txt "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
