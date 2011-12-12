# Maintainer: Jonathan Fine were.Vire_AT_gmail_DOT_com

pkgname=mokoigaming-alchera
pkgver=0.92
pkgrel=1
url="http://mokoi.info/"
arch=('i686' 'x86_64')
license=('zlib')
pkgdesc="GTK-based mokoi game creator"
depends=("mokoigaming-luxengine=$pkgver" gtksourceview2 libsoup)
install=mokoi.install
source=("http://sourceforge.net/projects/mokoi/files/Mokoi%20Gaming/$pkgver/MokoiGaming-0_92-source.tar.bz2" "alchera.desktop" "mokoi.install")
md5sums=('a441e333b4d8fb05302e90e108deec9c'
         '58f05404ce593b2c5da4a6272d879f08'
         '29ec188aee1714a95c85e85829bf78b8')
build() {
	cd $srcdir/mokoi
	sed 's/ argv\[0\] /"\/usr\/lib\/alchera\/"/' -i Alchera/src/main.c
	sed 's/argv\[0\] = g_build_filename( Alchera_Directory(), ENGINE_FILENAME, NULL);/argv\[0\] = g_build_filename( "\/usr\/bin\/", ENGINE_FILENAME, NULL);/' -i loader_mokoi/src/project.c
	sed 's/Alchera_Directory2( "share\/gtksourceview-2.0\/language-specs" )/"\/usr\/share\/gtksourceview-2.0\/language-specs"/' -i Alchera/src/ma_editor.c
	
	#Copied form LinuxBuildScript.sh
	cd Alchera
	export USEGTKSOURCEVIEW=FALSE
	export USESOUP=FALSE
	make
	mv ../MokoiGaming/Alchera ../MokoiGaming/Alchera-basic
	export USEGTKSOURCEVIEW=TRUE
	export USESOUP=TRUE
	make
	cd ..
	cd libsdlplayback
	make
	cd ..
	cd loader_mokoi
	make
}

package() {
	_mokoiDir=$srcdir/mokoi/MokoiGaming/

	install -D -m 755 "$_mokoiDir/Alchera" "$pkgdir/usr/bin/alchera"
	install -D -m 755 "$_mokoiDir/Alchera-basic" "$pkgdir/usr/bin/alchera-basic"
	install -D -m 644 alchera.desktop "$pkgdir/usr/share/applications/alchera.desktop"
	install -D -m 644 "$_mokoiDir/loader_mokoi.so" "$pkgdir/usr/lib/alchera/loader_mokoi.so"
	install -D -m 644 "$_mokoiDir/libsdlplayback.so" "$pkgdir/usr/lib/alchera/libsdlplayback.so"
	cp -r "$_mokoiDir/mps_include/" "$pkgdir/usr/lib/alchera/"
	cp -r "$_mokoiDir/help/" "$pkgdir/usr/lib/alchera/"

	install -D -m 644 "$_mokoiDir/share/icons/hicolor/alchera-game-editor.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/alchera-game-editor.png"
	install -D -m 644 "$_mokoiDir/share/icons/hicolor/scalable/apps/alchera-game-editor.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/alchera-game-editor.svg"
	cp -r "$_mokoiDir/share/icons/hicolor/22x22/" "$pkgdir/usr/share/icons/hicolor/22x22/"
	install -D -m 644 "$_mokoiDir/share/gtksourceview-2.0/language-specs/pawn.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/pawn.lang"
	install -D -m 644 "$_mokoiDir/tango.xml" "$pkgdir/usr/lib/alchera/tango.xml"
	install -D -m 644 "$srcdir/mokoi/license.txt" "$pkgdir/usr/share/licenses/mokoigaming-alchera/LICENSE"
}
