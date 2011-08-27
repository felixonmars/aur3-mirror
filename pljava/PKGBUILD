# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>

_filename=1598/pljava-i686-pc-linux-gnu-pg8.3-1.4.0.tar.gz
pkgname=pljava
pkgver=1.4.0
pkgrel=1
pkgdesc="A free add-on module that brings standard JDBC interface to PostgreSQL"
arch=('i686' 'x86_64')
url=("http://pgfoundry.org/projects/pljava")
license=('BSD')
depends=('java-runtime' 'java-environment' 'postgresql')
[ "$CARCH" = "x86_64" ] && _filename=1591/pljava-x86_64-unknown-linux-gnu-pg8.3-1.4.0.tar.gz
source=("http://pgfoundry.org/frs/download.php/$_filename")
md5sums=('f1f98a8b6b0b5ec3ff36248f7376740d')
[ "$CARCH" = "x86_64" ] && md5sums[0]='6b7730f893f1a3e842a8b931c75965fb'

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/pljava
	cp *.jar *.sql docs.tar pljava.so $pkgdir/usr/share/pljava 
}


