# Author: Diogo Ferreira <diogo@underdev.org>
pkgname=csoap
pkgver=1.1.0
pkgrel=1
pkgdesc='Client/server SOAP library in pure C'
arch=('i686')
url='http://csoap.sourceforge.net/'
license=('LGPL')
depends=('glibc' 'openssl')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/libsoap-$pkgver.tar.gz)
md5sums=('725eba71ec3eb2d6d878f50cee334022')

build () {
	cd $startdir/src/libsoap-$pkgver
	./configure --prefix=/usr
	make
	make DESTDIR=$startdir/pkg install
}
