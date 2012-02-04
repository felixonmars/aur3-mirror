# Contributor: Kozec <kozec at kozec dot com>
pkgname=ivory-mahjongg-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Freeware solitaire tile matching game based on the single player game known most often as Mahjongg"
url="http://ivorymahjongg.com/"
depends=('java-runtime' 'java3d' 'log4j')
source=(
	"http://ivorymahjongg.com/distributions/Ivory-${pkgver}-Linux.tar.gz"
	"ivory-mahjongg"
	"ivory-mahjongg.desktop"
	"ivory-mahjongg.png"
	)
license=('custom')
arch=('i686' 'x86_64')
noextract=("Ivory-${pkgver}-Linux.tar.gz")
md5sums=('e4b5fd6f19d6de7c382373c813a80987'
         'dfd581f3ebbaadcbdc7c3769fa03d81f'
         'f0be944bab9d96b86a339c5d7ac87109'
         'e51b5766dcd96c87abfe4fe824362ed5')

build() {
	return 0
}

package() {
	mkdir -p "$pkgdir/usr/share/licenses/ivory-mahjongg-bin"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt/games/ivory-mahjongg"
	cd "$pkgdir/opt/games/ivory-mahjongg"
	tar xf "$srcdir/Ivory-${pkgver}-Linux.tar.gz" \
		--strip-components=1 \
		--exclude="j3d[^-]*" \
		--exclude="libj3d*" \
		--exclude="vecmath.jar"	\
		--exclude="log4j.jar" \
		|| return 1
	ln -s "../../../../opt/games/ivory-mahjongg/license.txt" "$pkgdir/usr/share/licenses/ivory-mahjongg-bin/LICENSE"
	cp -L "$srcdir/ivory-mahjongg" "$pkgdir/usr/bin"
	cp -L "$srcdir/ivory-mahjongg.png" "$pkgdir/usr/share/pixmaps"
	cp -L "$srcdir/ivory-mahjongg.desktop" "$pkgdir/usr/share/applications"
}
