# Contributor: Nathanael Moore <darkmeerkat@gmail.com>

pkgname=palm-db-tools
pkgver=0.3.6
pkgrel=1
pkgdesc="Several utilities that convert text files in CSV (comma-separated value) format to several flat-file database formats used on PalmOS PDAs and back again"
arch=('i686')
url="http://pilot-db.sourceforge.net/"
license=('GPL')
depends=('glibc' 'libstdc++5')
makedepends=('gcc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-0_3_6.tar.gz" 'Block.h.patch' 'File.h.patch')
md5sums=('483d2b18dcc2ef8cd5f7e27715d43bfe' '07cb5e32d65b66894fe80d101c9c4339' '405780a1528258160f09bd77acf3b524')

build() {
	patch -Np0 -iBlock.h.patch $startdir/src/$pkgname/libpalm/Block.h || return 1
	patch -Np0 -iFile.h.patch $startdir/src/$pkgname/libpalm/File.h || return 1
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  make || return 1
  install -m755 -D $startdir/src/$pkgname/flatfile/csv2pdb $startdir/pkg/usr/bin/csv2pdb
  install -m755 -D $startdir/src/$pkgname/flatfile/pdb2csv $startdir/pkg/usr/bin/pdb2csv
  install -m755 -D $startdir/src/$pkgname/flatfile/libpdbtools.so $startdir/pkg/usr/lib/libpdbtools.so
}
