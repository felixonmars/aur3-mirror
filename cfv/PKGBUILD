# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Aur Maintainer: @jsalwan

pkgname=cfv
pkgver=1.18.3
_fullver="$pkgname-$pkgver"
pkgrel=3
pkgdesc="An utility to both test and create checksum files"
arch=('any')
url="http://cfv.sourceforge.net/"
license=('GPL')
depends=('python2')
optdepends=('pil: for creation the dimensions column of .crc files'
            'python-fchksum: for increase checksumming speed a bit'
            'bittorrent: for torrent checking')
source=(http://downloads.sourceforge.net/$pkgname/$_fullver.tar.gz)
md5sums=('1be9039c2ab859103d70b6c4f4e5edf5')

build() {
  cd "$srcdir/$_fullver"
  patch -p 0 << DIFF
--- cfv
+++ cfv
@@ -1,3 +1,3 @@
-#! /usr/bin/env python
+#! /usr/bin/env python2
 
 #    cfv - Command-line File Verify
DIFF
}

package() {
  make -C "$srcdir/$_fullver" install=install PYTHON=python2 prefix=/usr \
    mandir=/usr/share/man DESTDIR="$pkgdir" install
}


