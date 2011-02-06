# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb-geom
pkgver=0.16.3
pkgrel=1
pkgdesc="Provides geometry functionality to the MonetDB database system."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom') # comes with monetdb
depends=('geos' 'monetdb-sql')
source=("http://monetdb.cwi.nl/downloads/sources/Feb2010-SP1/MonetDB-geom-$pkgver.tar.bz2")
md5sums=('e66c483360fd3aab3ea91c98dc8f1597')

build() {
  mkdir $srcdir/build
  cd $srcdir/build

  $srcdir/MonetDB-geom-$pkgver/configure --prefix=/usr --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
