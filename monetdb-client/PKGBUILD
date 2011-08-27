# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb-client
pkgver=1.40.3
pkgrel=1
pkgdesc="Client for the MonetDB database system."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom') # comes with monetdb
depends=('monetdb')
source=("http://dev.monetdb.org/downloads/sources/Oct2010-SP1/MonetDB-client-$pkgver.tar.bz2")
md5sums=('88ad93cf10a06aef97cacf47330fe75b')


build() {
  mkdir $srcdir/build
  #cd $srcdir/build

  #$srcdir/MonetDB-client-$pkgver/configure --prefix=/usr --enable-optimize
  
  cd $srcdir/MonetDB-client-$pkgver/
  ./configure --prefix=/usr --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
