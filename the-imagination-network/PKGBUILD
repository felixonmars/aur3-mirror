# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="the-imagination-network"
pkgver="1.0"
pkgrel=1
pkgdesc="A classic social game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/27568/ImagiNation+Network%2C+The.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='innrevival.install'
depends=('dosbox')
makedepends=('wine')
optdepends=('abandonia-menu')
source=('http://www.sierrahelp.com/Files/NewInstallers/INNRevivalDOSBoxInstaller.exe' 'dosbox.conf')
md5sums=('013c84c267a5be5aaf7f9af2f5c7b158' 'eb61b114e9610f501dde4f856fdae792')
_pkgabbrev="innrevival"
_exe="INN.BAT"
_icon="INN.ICO"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
# Install the dosbox image.
	WINEPREFIX=$srcdir/.tmp/ wine $srcdir/INNRevivalDOSBoxInstaller.exe
}

package() {
        cp -ar $srcdir/.tmp/drive_c/Sierra/INNRevival/* "$pkgdir/opt/abandonia/$_pkgabbrev"
	cp -ar $srcdir/dosbox.conf "$pkgdir/opt/abandonia/$_pkgabbrev" 

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
