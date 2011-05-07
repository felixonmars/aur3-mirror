# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="starwars-chess"
pkgver="1.0"
pkgrel=2
pkgdesc="A classic board game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/5205/Star+Wars+Chess.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='sw-chess.install'
depends=('dosbox')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Star+Wars+Chess&secure=125b31951f5eeee46906b9561cf1ece6&td=1298144186' 'sw-chess.png')
md5sums=('27ebd9fbbbd22b7c0f1b6117f2464a58' 'b890bf1804f3dee268158e04c4e1a841')
_pkgabbrev="sw-chess"
_exe="SWC.EXE"
_icon="sw-chess.png"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/SWCHESS/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/ 
	printf "#!${SHELL}

mkdir -p ~/.abandonia/$_pkgabbrev

if whereis dosbox>/dev/null 2>&1;
	then
		dosbox /opt/abandonia/$_pkgabbrev/$_exe mount c ~/.abandonia/$_pkgabbrev
	else
		echo '==> Please get sure to have dosbox installed and have it in your PATH array.'
fi
return \$?" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 
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
