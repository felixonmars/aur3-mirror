# Maintainer: scorici <scorici AT yahoo DOT com>
pkgname=tarrasch-chess-gui
pkgver=2.02br
pkgrel=1
pkgdesc="The Tarrasch Chess GUI"
arch=(any)
url="http://www.triplehappy.com"
license=('freeware' 'open-source')
depends=('wine')
makedepends=('unzip')
source=("$url/downloads/portable-tarrasch-v$pkgver.zip"
"https://bitbucket.org/billforsternz/$pkgname/raw/fb3711a95bc547fa91aa3fffd7d05d8bf698f4ba/tarrasch.ico")
md5sums=('f7e4a7cd9680e997ad74442097acabe0'
         'b0ce4ab2350c049bcba827225ca9fe63')
package() {
mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/$pkgname $pkgdir/usr/share/applications
unzip -q portable-tarrasch-v$pkgver.zip -d $pkgdir/usr/share/$pkgname
cp tarrasch.ico $pkgdir/usr/share/$pkgname/$pkgname.ico
echo "
[Desktop Entry]
Version=1.0
Name=$pkgdesc
Comment=Play chess against engines, analyze and edit games.
Exec=$pkgname
Icon=/usr/share/$pkgname/$pkgname.ico
Categories=Game;BoardGame;
Type=Application
Terminal=false
StartupNotify=false
" > $pkgdir/usr/share/applications/$pkgname.desktop
echo "#!/bin/bash
if [ ! -d ~/.$pkgname ]; then
	mkdir ~/.$pkgname
fi
if [ ! -f ~/.$pkgname/Tarrasch.ini ]; then
	touch ~/.$pkgname/Tarrasch.ini
fi
ln -sv /usr/share/$pkgname/Engines ~/.$pkgname
ln -sv /usr/share/$pkgname/book.pgn ~/.$pkgname
ln -sv /usr/share/$pkgname/Tarrasch.exe ~/.$pkgname
cd ~/.$pkgname
wine Tarrasch.exe
exit"> $pkgdir/usr/bin/$pkgname
find "$pkgdir"/usr -type f -exec chmod 644 "{}" \;
find "$pkgdir"/usr -type d -exec chmod 755 "{}" \;
chmod +x $pkgdir/usr/bin/$pkgname
}
