# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=pornotube-dl
pkgver=2008.06.03
pkgrel=2
pkgdesc="A small command-line program to download videos from PornoTube.com"
arch=('any')
url="http://www.arrakis.es/~rggi3/pornotube-dl"
license=('MIT')
depends=('python2')
source=("http://www.arrakis.es/~rggi3/$pkgname/$pkgname")
md5sums=('0ab81618edde94887b0bde863aa8c493')

build(){
 sed -i 's%\(#!/usr/bin/env python\)%\12%' "$srcdir/$pkgname"
}

package() {
 install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
