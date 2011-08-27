# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb-xquery
pkgver=0.36.3
pkgrel=1
pkgdesc="The XQuery component for the MonetDB database system."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom') # comes with monetdb
depends=('monetdb4-server' 'flex' 'bison' 'libxml2')
source=("http://monetdb.cwi.nl/downloads/sources/Feb2010-SP1/MonetDB-XQuery-$pkgver.tar.gz")
md5sums=('e53dbb45b11a87f2227a2d81a252f5f3')

build() {
  mkdir $srcdir/build
  cd $srcdir/build

  $srcdir/MonetDB-XQuery-$pkgver/configure --prefix=/usr --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
