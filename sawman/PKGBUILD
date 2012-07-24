# Contributor: bountykiller <masse.nicolas@gmail.com>

pkgname=sawman
pkgver=1.6.0
pkgrel=1
pkgdesc="Window Manager Module for directfb"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.directfb.org"
depends=('directfb-multi') # 'kernel26'
source=(http://www.directfb.org/downloads/Extras/SaWMan-$pkgver.tar.gz)
md5sums=('e6157915e9197fd78e2cd11184fe94f3')

build () {
	cd $srcdir/SaWMan-$pkgver/
	./configure --prefix=/usr
	make
	make DESTDIR=$pkgdir install
}
md5sums=('15664128a5dbd57b3c15888c10cf23d4')
