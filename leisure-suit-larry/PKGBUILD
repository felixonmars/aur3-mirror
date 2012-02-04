# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="leisure-suit-larry"
pkgver="1.0"
pkgrel=4
pkgdesc="A classic adventure game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/120/Leisure+Suit+Larry+1+-+in+the+Land+of+the+Lounge+Lizards.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='larry1.install'
depends=('dosbox')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Leisure+Suit+Larry+1+-+in+the+Land+of+the+Lounge+Lizards&secure=413c4e541e1210e8be652772446dc02f&td=1297708983' 'Larry1.gif')
md5sums=('73161dc388fdcbb9c4ff2155d840a0db' '8b6793a1fd133ec004a7d22e5919b51d')
_pkgabbrev="Larry1"
_exe="LL.COM"
_icon="Larry1.gif"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/Leisure\ Suit\ Larry\ 1.1987/* "$pkgdir/opt/abandonia/$_pkgabbrev"
	cp -ar $srcdir/$_icon $pkgdir/opt/abandonia/$_pkgabbrev/

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
