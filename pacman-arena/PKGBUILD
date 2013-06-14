# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Benjamin Debski <benjamin.debski@gmail.com>
pkgname=pacman-arena
pkgver=0.15
pkgrel=6
pkgdesc="Pacman Arena is a Pacman clone in full 3D with a few surprises"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pacmanarena/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_net' 'mesa' 'glu')
changelog=Changelog
source=("http://downloads.sourceforge.net/sourceforge/pacmanarena/pacman-arena-${pkgver}.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/pacmanarena/pacman-data-0.0.zip"
	"PacmanArena.desktop")
sha256sums=('3f151518f3d4a9595ea03f9ef681e8a8829e88e76fb5d39bab0249906121fc23'
            '7949f080ca0ba4c02d737c5bb365856c3e66f103838329be8c1857d6c297b9b8'
            '90c4ca5f27971ab47bae5998b21085292acb0d14af903de5994e0adbd20b62b0')

prepare() {
	cd $srcdir/pacman
	# fix linking
	sed -i 's/^LDFLAGS=/LDFLAGS= -lm /' Makefile.in
	# fix datadir
	sed -i 's#datadir@/pacman#datadir@/pacman-arena#' Makefile.in
}

build() {
	cd $srcdir/pacman
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/pacman

	# binary
	install -Dm755 pacman $pkgdir/usr/bin/pacman-arena

	# data
	install -dm755 $pkgdir/usr/share/pacman-arena/gfx
	install -m644 $srcdir/gfx/* $pkgdir/usr/share/pacman-arena/gfx

	install -dm755 $pkgdir/usr/share/pacman-arena/sfx
	install -m644 $srcdir/sfx/* $pkgdir/usr/share/pacman-arena/sfx

	# desktop file
	install -Dm644 $srcdir/PacmanArena.desktop $pkgdir/usr/share/applications/PacmanArena.desktop
}

