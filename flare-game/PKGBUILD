# Maintainer: Mikael Erikson <mikael_eriksson@miffe.org>
pkgname=flare-game
pkgver=0.19
pkgrel=2
pkgdesc="Fantasy action RPG using the FLARE engine"
arch=('any')
url="http://flarerpg.org/"
license=('CC-BY-SA 3.0')
depends=('flare-engine')
makedepends=('cmake')
conflicts=('flare-rpg')
replaces=('flare-rpg')
source=(http://sourceforge.net/projects/flare-game/files/Linux/flare-game.$pkgver.tar.gz)
md5sums=('0d2950b8f6facc640a019aecd3a1fdb8')

build() {
	cd "$srcdir/$pkgname.$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make

}

package() {
	cd "$srcdir/$pkgname.$pkgver"
	make DESTDIR="$pkgdir/" install

	cat >flare-game <<EOF
#!/bin/sh
exec /usr/bin/flare --game=flare-game "\$@"
EOF
	install -Dm755 flare-game $pkgdir/usr/bin/flare-game
}
