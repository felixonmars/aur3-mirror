# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="kings-quest-3-agd-remake"
pkgver="1.0"
pkgrel=3
pkgdesc="A free windows port of the classic adventure game from Abandonia, played in Wine."
url=('http://www.agdinteractive.com/games/kq3/about/overview.html')
arch=('i686' 'x86_64')
license=('custom-freeware' 'Abandonware')
install='kq3.install'
depends=('wine' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('http://agdinteractive.com/countdl.php?action=download&game=13')
md5sums=('4aa10efe6259a3f589a2d8250eafba10')
_exe="Launcher.exe"
_pkgabbrev="kq3"

if [ ${CARCH}=x86_64 ]
  then
    _winedir="drive_c/Program\ (\x86\)/AGD\ Interactive/King\'s\ Quest\ III\ Redux"
  else
    _winedir="drive_c/Program\ Files/AGD\ Interactive/King\'s\ Quest\ III\ Redux"
fi

_icon="$_winedir/kq3reduxmenu.ico"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	mv $srcdir/"countdl.php?action=download&game=13" $srcdir/Kq3install.exe
	mkdir -p -m755 $srcdir/.tmp
	WINEPREFIX=$srcdir/.tmp/ wine $srcdir/Kq3install.exe
}

package() {
	cp -ar $srcdir/.tmp/* "$pkgdir/opt/abandonia/$_pkgabbrev"

	#ok, let's use a script to start the game
        #script also include union mount in order to enable multi-user playing of this game from a single install.

	mkdir -p -m755 /$pkgdir/usr/bin/ 

	printf "#!${SHELL}
		mkdir -p ~/.abandonia/$_pkgabbrev/persistent
		mkdir ~/.abandonia/$_pkgabbrev/temp
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
