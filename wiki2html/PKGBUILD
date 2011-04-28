# -*- mode: sh; -*-
# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=wiki2html
pkgver=1
pkgrel=1
pkgdesc="Convert the wiki source to the HTML page"
url="http://tools.wikimedia.de/~merphant/wiki2html/"
arch=('any')
license=('None')

source=("http://tools.wikimedia.de/~merphant/$pkgname/$pkgname.tar.gz")

build() {
  cd $srcdir/$pkgname

  make

  mkdir -p $pkgdir/usr/local/bin
  mv $pkgname $pkgdir/usr/local/bin
}

md5sums=('25f3113618641fea0710ae29b65a8216')
