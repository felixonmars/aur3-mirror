# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb-sql
pkgver=2.36.3
pkgrel=1
pkgdesc="The SQL component for the MonetDB database system."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom') # comes with monetdb
depends=('monetdb5-server')
source=("http://monetdb.cwi.nl/downloads/sources/Feb2010-SP1/MonetDB-SQL-$pkgver.tar.bz2")
md5sums=('59b5e3b1760f56ed4c92f00f9e873759')

build() {
  mkdir $srcdir/build
  cd $srcdir/build

  $srcdir/MonetDB-SQL-$pkgver/configure --prefix=/usr --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
