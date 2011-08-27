pkgname=udns-so
_pkgname=udns
pkgver=0.0.9
pkgrel=1
pkgdesc="UDNS is a stub DNS resolver library with ability to perform both syncronous and asyncronous DNS queries (compiled as shared object)"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.corpit.ru/mjt/udns.html"
depends=()
makedepends=()
backup=()
conflicts=('udns')
provides=('udns')
source=(http://www.corpit.ru/mjt/udns/udns_0.0.9.tar.gz)

md5sums=('78843added6f6b690bc6019ab8ef03c9')

build()
{
	cd ${startdir}/src/${_pkgname}-${pkgver}
	./configure
	make static shared || return 1
	mkdir -p ${startdir}/pkg/usr/lib/
	mkdir -p ${startdir}/pkg/usr/include/
	cp libudns.a ${startdir}/pkg/usr/lib/
	cp libudns.so.0 ${startdir}/pkg/usr/lib/libudns.so
    ln -s libudns.so ${startdir}/pkg/usr/lib/libudns.so.0
	cp libudns_s.so ${startdir}/pkg/usr/lib/
	cp udns.h ${startdir}/pkg/usr/include/
}
