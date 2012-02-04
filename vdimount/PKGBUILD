# Contributor: ezzetabi <ezzetabi at gawab dot com>

pkgname=vdimount
pkgver=0
pkgrel=2
pkgdesc="Tool to mount the partitions inside the virtualbox hard drives (vdi files)"
arch=(i686 x86_64)
url="http://muralipiyer.blogspot.com/2008/02/mounting-virtualbox-vdi-disk-authentic.html"
license=('unknown')
depends=(perl)
makedepends=(gcc)
install=
source=('http://pastebin.ca/raw/1297025' 'http://pastebin.ca/raw/1297026')

build() {
  cd "$srcdir"
  <1297025 tr -d '\r' >vdimount
  mv 1297026 vdiinfo.c
  gcc -o vdiinfo vdiinfo.c || return 1

  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 vdiinfo "$pkgdir/usr/bin"
  install -m 755 vdimount "$pkgdir/usr/bin"
}

md5sums=('3fc12ea57cacce1ba14804912a8dac78'
         'e99402b1955cbfcac9531f432c2a21ac')

# vim:set ts=2 sw=2 et:

