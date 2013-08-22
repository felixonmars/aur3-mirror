# Submitter: Guo Xiao <guoxiao08@gmail.com>

pkgname=php-leveldb-git
pkgver=136.5c9b283
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='PHP binding for Google LevelDB'
url='https://github.com/reeze/php-leveldb'
depends=('php>=5.2' 'leveldb>=1.7')
makedepends=('git')
conflicts=('php-leveldb')
provides=('php-leveldb')
license=('PHP')
source=('git://github.com/reeze/php-leveldb.git')
backup=('etc/php/conf.d/leveldb.ini')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/php-leveldb
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd $srcdir/php-leveldb
	phpize
	./configure --with-leveldb=/usr/lib/libleveldb.so --prefix=/usr 
	make
}
package() {
	cd $srcdir/php-leveldb
	make INSTALL_ROOT=$pkgdir install
	echo ';extension=leveldb.so' > leveldb.ini
	install -D -m644 leveldb.ini $pkgdir/etc/php/conf.d/leveldb.ini
}
