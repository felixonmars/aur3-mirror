pkgname=snoopy
pkgver=2.9.99.4b
pkgrel=1
pkgdesc="A banlist like utility for Warcraft 3."
arch=(i686 x86_64)
url="http://www.snoopy.tuxfamily.org/"
license=('GPL')
source=(http://snoopy.tuxfamily.org/files/$pkgname-$pkgver.tar.gz)
depends=('geoip' 'dsniff' 'xclip')
makedepends=('make')
md5sums=('6b9b7d80969a6e947d49e65b6efcf237')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$pkgdir/usr install
}
