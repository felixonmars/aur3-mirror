# Maintainer: Jimmy Christensen <dusted [at] dusted (dot) dk>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=osgg-git
epoch=1
pkgver=16.5524fff
pkgrel=1
pkgdesc="a 2D game inspired by lunar lander with sweet 70's style vector graphics"
url="http://osgg.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('osgg')
depends=('sdl_image' 'gcc-libs' 'sdl_ttf' 'libgl' 'sdl_mixer' 'qt4' )
makedepends=('git')

source=('git://github.com/DusteDdk/Osgg.git')
md5sums=('SKIP')

pkgver() {
	cd Osgg

	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd Osgg

	msg "Building Osgg"
	make

	cd launcher

	msg "Building Launcher"
	qmake-qt4
	make
}

package() {
	cd Osgg

	install -dm755 "$pkgdir/usr/bin" \
	               "$pkgdir/usr/lib/osgg" \
	               "$pkgdir/usr/share/osgg"/{levels,demos} \
	               "$pkgdir/usr/share/applications"

	install -m755 osgg launcher/launcher \
	              "$pkgdir/usr/lib/osgg"

	# The launcher is dumb and looks in cwd for both binary and data, so give it that...
	ln -s "/usr/lib/osgg/osgg" "$pkgdir/usr/share/osgg/osgg"

	install -Dm644 launcher/icon.png \
	               "$pkgdir/usr/share/pixmaps/osgg.png"

	install -m644 *.txt *.ogg Bandal.ttf \
	              "$pkgdir/usr/share/osgg"

	install -m644 levels/* \
	              "$pkgdir/usr/share/osgg/levels"

	install -m644 demos/* \
	              "$pkgdir/usr/share/osgg/demos"

	cat > "$pkgdir/usr/bin/osgg" <<-EOF
	#!/bin/sh
	cd /usr/share/osgg
	exec /usr/lib/osgg/launcher
	EOF

	chmod 755 "$pkgdir/usr/bin/osgg"

	cat > "$pkgdir/usr/share/applications/osgg.desktop" <<-EOF
	[Desktop Entry]
	Type=Application
	Name=OldSkoolGravityGame
	Comment=Lunar lander skillgame
	Exec=osgg
	Icon=osgg.png
	Categories=Game;ArcadeGame;
	EOF
}
