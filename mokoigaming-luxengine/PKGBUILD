# Maintainer: Jonathan Fine were.Vire_AT_gmail_DOT_com

pkgname=mokoigaming-luxengine
pkgver=0.92
pkgrel=1
url="http://mokoi.info/"
arch=('i686' 'x86_64')
license=('zlib')
pkgdesc="SDL-based game engine that runs mokoi games"
depends=(sdl_image sdl_gfx sdl_mixer libgl gcc-libs)
install=mokoi.install
source=("http://sourceforge.net/projects/mokoi/files/Mokoi%20Gaming/$pkgver/MokoiGaming-0_92-source.tar.bz2" "luxengine.desktop" "mokoi.install")
md5sums=('a441e333b4d8fb05302e90e108deec9c'
         '9909c5bb0ca3da9d04801e0670cf00b1'
         '8eb69e5f30d50599e5884689bedfa352')

build() {
	cd $srcdir/mokoi/luxengine
	make
}

package() {
	_mokoiDir=$srcdir/mokoi/MokoiGaming/

	install -D -m 755 "$_mokoiDir/luxengine" "$pkgdir/usr/bin/luxengine"
	install -D -m 644 luxengine.desktop "$pkgdir/usr/share/applications/luxengine.desktop"
	install -D -m 644 "$_mokoiDir/extras/linux-mime.xml" "$pkgdir/usr/share/mime/packages/mokoi-mime.xml"
	install -D -m 644 "$_mokoiDir/share/icons/hicolor/mokoi-gaming.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mokoi-gaming.png"
	install -D -m 644 "$_mokoiDir/share/icons/hicolor/scalable/apps/mokoi-gaming.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mokoi-gaming.svg"	
	install -D -m 644 "$srcdir/mokoi/license.txt" "$pkgdir/usr/share/licenses/mokoigaming-luxengine/LICENSE"
}
