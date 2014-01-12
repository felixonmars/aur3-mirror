# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=catchchallenger-mmorpg
pkgver=0.2
pkgrel=1
pkgdesc="openSource oldschool MMORPG"
arch=('i686' 'x86_64')
url="http://catchchallenger.first-world.info/"
license=('GPL')
depends=('qt5-multimedia')
source=("https://github.com/alphaonex86/CatchChallenger/archive/${pkgver}.tar.gz")
md5sums=('2320f16c73b85ab2679d0d17c152370e')

build() {
	cd "$srcdir/CatchChallenger-$pkgver/client/single-server"
	qmake
	make
}

package() {
	cd "$srcdir/CatchChallenger-$pkgver/client/single-server"
	#make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/bin"
	cp catchchallenger-single-server "$pkgdir/usr/bin"
}
