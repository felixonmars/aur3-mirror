# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="starwars-vector-arcade"
pkgver="1.0"
pkgrel=1
pkgdesc="A classic space arcade game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/25183/Star+Wars+-+The+Arcade+Game.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='swarc.install'
depends=('dosbox')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Star+Wars+-+The+Arcade+Game&secure=075a442c883a94aafb3d2d06891f400d&td=1298154795' 'swarc.png')
md5sums=('f0c79fef23481fe6841b7cd8b76fa5af' 'be393b165870d07319c669dc90b1db1b')
_pkgabbrev="swarc"
_exe="starwars.exe"
_icon="'swarc.png"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

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
