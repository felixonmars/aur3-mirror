#Contributor: Sergey Plaksin <serp256 at gmail.com>


pkgname=memcachedb
pkgver=1.2.0
pkgrel=1
pkgdesc="Distributed key-value storage system designed for persistence"
arch=(i686 x86_64)
url="http://memcachedb.org"
license=('BSD')
depends=(db libevent)
source="http://memcachedb.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
md5sums=('1642242ab2108611873588b77848317b')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-threads
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
	install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	mkdir -p $pkgdir/usr/share/doc/$pkgname/
	cp doc/protocol.txt $pkgdir/usr/share/doc/$pkgname/
}
