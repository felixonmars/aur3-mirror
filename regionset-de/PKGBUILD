# Contributor: Robert Orzanna <orschiro@googlemail.com>
pkgname=regionset-de
pkgver=0.2
pkgrel=1
pkgdesc="liest/setzt den Region Code von DVD-Laufwerken"
arch=('i686' 'x86_64')
url="http://linvdr.org/projects/regionset/"
license=('GPL')
source=(http://linvdr.org/download/regionset/regionset-0.2-de.i386.tar.gz)
md5sums=('837bc10d2881740b52e52483a1bf98b0')
conflicts=('regionset')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  install -D -m 755 $startdir/src/$pkgname-$pkgver/regionset $startdir/pkg/usr/sbin/regionset
}

