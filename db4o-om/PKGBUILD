# Contributor: Christopher Heien <chris.h.heien@gmail.com>

pkgname=db4o-om
altname=objectmanager
pkgver=7.4
pkgrel=1
pkgdesc="Object Manager interface for db4o object oriented DBMS" 
arch=('i686' 'x86_64')
url="http://code.google.com/p/db4o-om/"
license=('GPL2')
depends=('java-runtime')
source=(http://$pkgname.googlecode.com/files/%24$altname-%20$pkgver-java.zip 
objectmanager )
sha1sums=('e9434d208a2c91e32860339f73b38cd969ab69f9'
	  '1d2b5631ee5043df42f1448a5e08286466003e28')


build() {
  mkdir -p $pkgdir/usr/share/java/$pkgname 
  mkdir -p $pkgdir/usr/bin
  cp -a $srcdir/$pkgver/* $pkgdir/usr/share/java/$pkgname/
  install --mode=0755 $srcdir/objectmanager $pkgdir/usr/bin/objectmanager
}

