# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=flare-engine
pkgver=0.19
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine"
arch=('i686' 'x86_64')
url="http://flarerpg.org/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('cmake')
conflicts=('flare-rpg')
replaces=('flare-rpg')
source=(http://sourceforge.net/projects/flare-game/files/Linux/flare-engine.$pkgver.tar.gz)
md5sums=('160325e67edf6ce83aeee3b1cd84598a')

build() {
	cd "$srcdir/$pkgname.$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname.$pkgver"
	make DESTDIR="$pkgdir/" install
}
