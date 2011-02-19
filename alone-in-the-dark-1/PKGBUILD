# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="alone-in-the-dark-1"
pkgver="1.0"
pkgrel=2
pkgdesc="A classic horror adventure game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/91/Alone+in+the+Dark.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='AITD.install'
depends=('dosbox')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Alone+in+the+Dark&secure=6c5d00f0274d739e54ff6e7931672821&td=1298142295' 'start.bat')
md5sums=('4975c07214c62a6da8ea580fd51f4837' '39985d5cbaf5bd8a12791cf455a3e0bf')
_pkgabbrev="AITD"
_exe="start.bat"
_icon="/INDARK/INDARK.ICO"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/AITD/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/ 
	printf "#!${SHELL}
if whereis dosbox>/dev/null 2>&1;
	then
		dosbox /opt/abandonia/$_pkgabbrev/$_exe
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
