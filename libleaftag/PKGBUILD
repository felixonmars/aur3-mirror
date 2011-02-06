# Maintainer: Andreas B. Wagner <AndreasBWagner@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libleaftag
pkgver=0.3.0
pkgrel=2
pkgdesc="The core tagging library for leaftag"
arch=('i686' 'x86_64')
url="http://www.chipx86.com/w/index.php/Leaftag"
license=('GPLv2.1')
depends=('glib2' 'sqlite2')
makedepends=('pkgconfig')
source=(http://releases.chipx86.com/leaftag/libleaftag/$pkgname-$pkgver.tar.gz)
md5sums=('5328f5ccb00c5a1902ce1697cd58573e')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install

	find $pkgdir -name '*.la' -exec rm {} \;
}
