# Maintainer: André Prata <andreprata at bugflux dot org>

pkgname=lockx
pkgver=20080829
pkgrel=1
pkgdesc="A simple X locker, heavily based on slock."
arch=('i686' 'x86_64')
url="http://bugflux.org/category/dev/"
license=('MIT')
depends=('libx11')
source=(http://bugflux.org/bugdev/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('df303b12ced7d0353dea72964dc8ceda')

build() {
	cd $startdir/src/$pkgname-$pkgver
	sed -i "s/%CFLAGS%/$CFLAGS/g" config.mk

	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
#	install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
