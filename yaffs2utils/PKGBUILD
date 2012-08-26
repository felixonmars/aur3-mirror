# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 29 May 2010

pkgname=yaffs2utils
pkgver=0.2.9
pkgrel=1
pkgdesc="A collection of utilities to make/extract a YAFFS2/YAFFS1 image for Linux. Currently includes mkyaffs2, unyaffs2 and unspare2."
arch=('i686' 'x86_64')
url=('http://code.google.com/p/yaffs2utils')
license=('GPL2')
depends=()
makedepends=('gcc')
options=('strip')
source=(http://yaffs2utils.googlecode.com/files/$pkgver.tar.gz)
md5sums=('eb00dce4357dae09c1cc0e16478095f2')

build() {
  cd $srcdir/$pkgver
  make
}

package() {
  cd $srcdir/$pkgver
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/$pkgver/mkyaffs2 $pkgdir/usr/bin/
  install -m 0755 $srcdir/$pkgver/unyaffs2 $pkgdir/usr/bin/
  install -m 0755 $srcdir/$pkgver/unspare2 $pkgdir/usr/bin/
}
