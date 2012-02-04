# Author: Markus Golser <elmargol@googlemail.com>
pkgname=ctrlproxy
pkgver=3.0.8
pkgrel=1
pkgdesc="IRC proxy with conversation replay support " 
arch=(i686 x86_64 ppc)
url="http://www.ctrlproxy.org/" 
license="GPL" 
depends=('gnutls' 'glib2' 'heimdal') 
makedepends=('gcc' 'pkgconfig')
source=(http://www.ctrlproxy.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('b54a8011fe2972724b3e42374e6bac1c')

build() { 
	cd $startdir/src/$pkgname-$pkgver 
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make install DESTDIR=$pkgdir || return 1
}
