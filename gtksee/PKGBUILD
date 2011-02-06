# Contributor: Zerial <fernando@zerial.org>
pkgname=gtksee
pkgver=0.6.0b
pkgrel=3
pkgdesc="An image viewer based in GTK+"
arch=('i686' 'x86_64')
url="http://gtksee.berlios.de"
license=('GPL')
depends=('gtk>=1.2.5')
install=
source=(http://download.berlios.de/gtksee/$pkgname-$pkgver-1.tar.gz)
md5sums=('faf4196ea38df0da93d9f403c03883a3')

build(){
	cd $startdir/src/$pkgname-$pkgver-1
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg/ install ||return 1
}
