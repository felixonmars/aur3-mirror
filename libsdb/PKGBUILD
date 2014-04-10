# maintainer: perlawk

pkgname=libsdb
_pkgname=sdb
pkgver=0.10.1
pkgrel=2
pkgdesc="LibSDB, the simple database library, which provides a way to support multiple database management systems: Gdbm, Lago, Mimer, MySQL, Postgres, Sqlite, and Oracle."
arch=('i686' 'x86_64')
url="http://siag.nu/morestuff.html"
license=('LGPL')
depends=('sqlite3' 'postgresql' 'gdbm' 'shsql')
install=sdb.install
source=("http://siag.nu/pub/libsdb/$_pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
  ./configure --prefix=/usr --with-sqlite3 --with-postgres --with-gdbm --with-shsql
  make
}

package() {
  cd "${srcdir}"/$_pkgname-$pkgver
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/lib
	mkdir -p "$pkgdir"/usr/share/man/man3
	mkdir -p "$pkgdir"/usr/share/man/man8
	mkdir -p "$pkgdir"/usr/include
	cp sdb-config sdb_client sdbd sdbd_client "$pkgdir"/usr/bin
	cp libsdb.so.0.10.0	libsdb.a "$pkgdir"/usr/lib
	cp sdb.h "$pkgdir"/usr/include
	cp *.3  "$pkgdir"/usr/share/man/man3
	cp *.8  "$pkgdir"/usr/share/man/man8
}

md5sums=('60bbb11ef51b5ed79305cf9dbef82b69')
