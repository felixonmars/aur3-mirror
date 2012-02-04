# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=battle-chess
pkgver=1.0
pkgrel=3
pkgdesc="A classic board game from Abandonia, played in Wine."
url='http://www.abandonia.com/en/games/308/Battle+Chess.html'
arch=('i686' 'x86_64')
license=('custom-freeware' 'Abandonware')
install=battle-chess.install
depends=('wine')
optdepends=('abandonia-menu')
# http://files.abandonia.com/download.php?game=Battle+Chess&secure=3ec224f02d7fddbeec7bcd5a1e004a25&td=1298229952
source=('Battle Chess.zip' 'battle-chess.png')
sha256sums=('57241ab10d6eef14fc8d5f8197253782c479b0c029f1efd648b6e1c0974ec4fe'
            'a5edc3a69d98da5a41551dd127c0a3b0709a00460fe66173e8df95c130b18052')
_pkgabbrev="bchess"
_exe="CHESS.EXE"
_icon="battle-chess.png"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 

	cp -ar $srcdir/chess/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/ 
if ${CARCH}=x86_64
then
	printf "#!${SHELL}
		WINEARCH=win32 WINEPREFIX=~/.abandonia/$_pkgabbrev wine /opt/abandonia/$_pkgabbrev/$_exe
	" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 
else
	printf "#!${SHELL}
		WINEPREFIX=~/.abandonia/$_pkgabbrev wine /opt/abandonia/$_pkgabbrev/$_exe
	" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 
fi

	chmod +x /$pkgdir/usr/bin/$_pkgabbrev.sh 
	ln -s $_pkgabbrev.sh /$pkgdir/usr/bin/$_pkgabbrev 

	# Automatic generation of a .desktop file

	mkdir -p -m644 "$pkgdir/usr/share/" 
	mkdir -p -m644 "$pkgdir/usr/share/applications/" 

	printf "[Desktop Entry]
Version=$pkgver
Type=Application
Name=$pkgname
Comment=$pkgdesc
Exec=/usr/bin/$_pkgabbrev
Icon=/opt/abandonia/$_pkgabbrev/$_icon
Categories=Game;Abandonia;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop

} 
