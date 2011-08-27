# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 29 May 2010

pkgname=yaffs2utils-latest
pkgver=0.1.9
pkgrel=1
pkgdesc="A collection of utilities to make/extract a YAFFS2/YAFFS1 image for Linux. Currently includes mkyaffs2 and unyaffs2."
arch=('i686' 'x86_64')
url=('http://code.google.com/p/yaffs2utils')
license=('GPL2')
depends=()
makedepends=('gcc')
options=('strip')
source=(http://yaffs2utils.googlecode.com/files/$pkgname.tar.gz)
sha256sums=('101c354ad78ba99548cc48c4f5fb129b87c784556a9c265695c5850965fd9f78')

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/$pkgname/src/mkyaffs2 $pkgdir/usr/bin/
  install -m 0755 $srcdir/$pkgname/src/unyaffs2 $pkgdir/usr/bin/
}
