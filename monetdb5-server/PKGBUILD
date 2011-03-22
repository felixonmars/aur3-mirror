# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=monetdb5-server
pkgver=5.22.3
pkgrel=1
pkgdesc="MonetDB database server version 5."
arch=('i686' 'x86_64')
url="http://monetdb.cwi.nl/"
license=('custom')
depends=('monetdb-client')
source=("http://dev.monetdb.org/downloads/sources/Oct2010-SP1/MonetDB5-server-$pkgver.tar.bz2")
md5sums=('301880682466cea96c4bd95cfae786dd')


build() {
  mkdir $srcdir/build
  cd $srcdir/build

  $srcdir/MonetDB5-server-$pkgver/configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-optimize --disable-debug --disable-assert
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
