# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=sselp
pkgver=0.2
pkgrel=2
pkgdesc="Simple X selection printer"
license=(MIT)
arch=('i686' 'x86_64')
url=http://www.suckless.org/wiki/programs/sselp
depends=(libx11)
source=(http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz)


package() {
	cd $srcdir/$pkgname-$pkgver
	sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
	make clean PREFIX=/usr DESTDIR=$pkgdir install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('b74d6558790d8df897db40bca90bc0f6')
