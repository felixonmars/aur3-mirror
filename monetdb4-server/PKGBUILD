# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb4-server
pkgver=4.36.3
pkgrel=1
pkgdesc="MonetDB database server version 4."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom') # comes with monetdb
depends=('monetdb-client')
source=("http://monetdb.cwi.nl/downloads/sources/Feb2010-SP1/MonetDB4-server-$pkgver.tar.gz")
md5sums=('99241e2fc87e34a33f658b799102f941')

build() {
  mkdir $srcdir/build
  cd $srcdir/build

  $srcdir/MonetDB4-server-$pkgver/configure --prefix=/usr --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
