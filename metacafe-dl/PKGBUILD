# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=metacafe-dl
pkgver=2008.07.23
pkgrel=2
pkgdesc="A small command-line program to download videos from MetaCafe.com"
arch=('any')
url="http://linux.softpedia.com/get/Internet/HTTP-WWW-/metacafe-dl-16475.shtml"
license=('MIT')
depends=('python2')
source=("http://ftp.debian.org/debian/pool/main/m/$pkgname/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('70b9788bd98b96dfeb653c6a49594a52')

build(){
 sed -i 's%\(#!/usr/bin/env python\)%\12%' "$srcdir/$pkgname-$pkgver/$pkgname"
}

package() {
 install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
