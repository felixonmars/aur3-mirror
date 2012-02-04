# Maintainer: Tino Reichardt <milky-archlinux@mcmilk.de>
pkgname=php-sqlite3
pkgver=0.5
pkgrel=1
pkgdesc="This package enables PHP scripts to access SQLite3 databases."
license="GPL"
depends=('sqlite3')
makedepends=('php' 'sqlite3')
conflicts=()
replaces=()
backup=()
install=php-sqlite3.install
url="http://php-sqlite3.sourceforge.net/"
source=(http://193.190.198.97/php-sqlite3/sqlite3-$pkgver.tgz)
md5sums=('bf3db9ee02088f77cedda99f6916dd07')

build() {
	cd $startdir/src/sqlite3-$pkgver
	phpize
	./configure
	make
	strip -g modules/sqlite3.so
	mkdir -p $startdir/pkg/usr/lib/php/extensions/php
	cp modules/sqlite3.so $startdir/pkg/usr/lib/php/extensions/php
}
