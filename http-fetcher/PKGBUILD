# Packager: Brad Fanella <bradfanella@gmail.com>
pkgname=http-fetcher
_pkgname=http_fetcher
pkgver=1.1.0
pkgrel=1
pkgdesc="A small, robust, flexible library for downloading files via HTTP using the GET method"
arch=('i686' 'x86_64')
url="http://http-fetcher.sourceforge.net/"
license=('LGPL')
provides=('http-fetcher')
source=(http://downloads.sourceforge.net/project/http-fetcher/http-fetcher/$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('7c4ff599b1024554e548e4bf85eee43e')

build() {
	cd ${srcdir}/$_pkgname-$pkgver/
	./configure --prefix=${startdir}/pkg/usr
	make CFLAGS="-Wall" || return 1
	make install
}

