# Contributor: Abakus <java5 at arcor dot de>
pkgname=afflib
pkgver=3.6.6
pkgrel=1
pkgdesc="is an extensible open format for the storage of disk images and related forensic information."
arch=('i686' 'x86_64')
url="http://www.afflib.org"
license=('GPL')
depends=('zlib' 'openssl' 'fuse')
source=("http://www.afflib.org/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('b7ff4d2945882018eb1536cad182ad01')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

