# Maintainer: Dimitar Shopov <optimuss[at]gmail(dot)com>

pkgname=bucardo
pkgver=4.4.6
pkgrel=1
pkgdesc='Bucardo is an asynchronous PostgreSQL replication system, allowing for both multi-master and multi-slave operations'
arch=('i686' 'x86_64')
license=('BSD')
source=(http://www.bucardo.org/downloads/Bucardo-${pkgver}.tar.gz
	http://www.bucardo.org/downloads/DBIx-Safe-1.2.5.tar.gz)
md5sums=('e74b526e9eb3ef7de936e720c4b2f222'
         '738fd4e994e84bb5ca09908308e904c6')
depends=('perl-dbd-pg')
url='http://www.bucardo.org'

build(){
  cd $srcdir/DBIx-Safe-1.2.5
  perl Makefile.PL
  make
  cd $srcdir/Bucardo-$pkgver
  perl Makefile.PL 
  make
}

package(){
  cd $srcdir/DBIx-Safe-1.2.5
  make DESTDIR=$pkgdir install
  cd $srcdir/Bucardo-$pkgver
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/bin/site_perl/* $pkgdir/usr/bin
  rm -rf $pkgdir/usr/bin/site_perl
  mkdir -p $pkgdir/var/run/bucardo
  mkdir -p $pkgdir/var/log/bucardo
}