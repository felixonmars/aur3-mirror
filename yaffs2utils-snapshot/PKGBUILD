# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 29 May 2010

pkgname=yaffs2utils-snapshot
_pkgver=`curl -s "http://code.google.com/p/yaffs2utils/downloads/detail?name=latest.tar.gz" | grep "snapshot on the trunk" | head -n1 | sed 's/.*(\([0-9]*\)).*/\1/'`
pkgver=20120815
pkgrel=1
pkgdesc="A collection of utilities to make/extract a YAFFS2/YAFFS1 image for Linux. Currently includes mkyaffs2 and unyaffs2."
arch=('i686' 'x86_64')
url=('http://code.google.com/p/yaffs2utils')
license=('GPL2')
depends=()
makedepends=('gcc' 'curl')
options=('strip')
_source=(http://yaffs2utils.googlecode.com/files/latest.tar.gz)

FORCE_VER=${_pkgver}

build() {
  curl -O ${_source}
  tar zxf latest.tar.gz
  cd $srcdir/latest
  make
}

package() {
  cd $srcdir/latest
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/latest/mkyaffs2 $pkgdir/usr/bin/
  install -m 0755 $srcdir/latest/unyaffs2 $pkgdir/usr/bin/
}
