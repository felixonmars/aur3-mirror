# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb-java
pkgver=1.36.3
pkgrel=1
pkgdesc="MonetDB JDBC driver."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom') # comes with monetdb
makedepends=('apache-ant')
source=("http://monetdb.cwi.nl/downloads/sources/Feb2010-SP1/MonetDB-java-$pkgver.tar.gz")
md5sums=('f0b297d92349b4ffe7bef53c1f2f5a65')

build() {
  mkdir $srcdir/build
  cd $srcdir/build

  $srcdir/MonetDB-java-$pkgver/configure --prefix=/usr --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
