# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="quest-for-glory-2"
pkgver="2.0"
pkgrel=1
pkgdesc="A free windows port of the classic adventure/RPG game from Abandonia, played in Wine."
url=('http://www.agdinteractive.com/games/qfg2/homepage/homepage.html')
arch=('i686' 'x86_64')
license=('custom-freeware' 'Abandonware')
install='qfg2.install'
depends=('wine' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('http://agdinteractive.com/countdl.php?action=download&game=10')
md5sums=('01c2b0ad11fa0e75816396511cac9b17')
_exe="Launcher.exe"
_pkgabbrev="qfg2"


if [ ${CARCH}=x86_64 ]
  then
    _winedir="drive_c/Program\ (\x86\)/AGD\ Interactive/Quest\ for\ Glory\ II"
  else
    _winedir="drive_c/Program\ Files/AGD\ Interactive/Quest\ for\ Glory\ II"
fi

_icon="$_winedir/qfgmenu.ico"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	mv $srcdir/"countdl.php?action=download&game=10" $srcdir/Qfgvga20.exe
	mkdir -p -m755 $srcdir/.tmp
	WINEPREFIX=$srcdir/.tmp/ wine $srcdir/Qfgvga20.exe
}

package() {
	cp -ar $srcdir/.tmp/* "$pkgdir/opt/abandonia/$_pkgabbrev"

	#ok, let's use a script to start the game
        #script also include union mount in order to enable multi-user playing of this game from a single install.

	mkdir -p -m755 /$pkgdir/usr/bin/ 

	printf "#!${SHELL}
		mkdir -p ~/.abandonia/$_pkgabbrev/persistent
		rm -rf ~/.abandonia/$_pkgabbrev/temp
		mkdir -p ~/.abandonia/$_pkgabbrev/temp
		unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/persistent=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
		cd ~/.abandonia/$_pkgabbrev/temp/$_winedir
		WINEPREFIX=~/.abandonia/$_pkgabbrev/temp wine $_exe
		cd ~/
		fusermount -u ~/.abandonia/$_pkgabbrev/temp
	" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 

	chmod +x /$pkgdir/usr/bin/$_pkgabbrev.sh 
	ln -s $_pkgabbrev.sh /$pkgdir/usr/bin/$_pkgabbrev 

	# Automatic generation of a .desktop file

	mkdir -p -m755 "$pkgdir/usr/share/" 
	mkdir -p -m755 "$pkgdir/usr/share/applications/" 

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
