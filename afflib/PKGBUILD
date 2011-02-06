# Contributor: Abakus <java5 at arcor dot de>
pkgname=afflib
pkgver=3.6.2
pkgrel=1
pkgdesc="is an extensible open format for the storage of disk images and related forensic information."
arch=('i686' 'x86_64')
url="http://www.afflib.org"
license=('GPL')
depends=('zlib' 'openssl' 'fuse')
source=("http://afflib.org/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('c30468c762c8e06776410ca8fb56b782')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

