# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="kings-quest-2-agd-remake"
pkgver="3.1c"
pkgrel=3
pkgdesc="A free windows port of the classic adventure game from Abandonia, played in Wine."
url=('http://www.abandonia.com/en/games/169/Kings+Quest+II+-+Romancing+the+Stones+VGA.html')
arch=('i686' 'x86_64')
license=('custom-freeware' 'Abandonware')
install='kq2.install'
depends=('wine' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('http://agdinteractive.com/countdl.php?action=download&game=12')
md5sums=('9b877a78b96c7bb34c1d2a95088e0ca7')
_exe="Launcher.exe"
_pkgabbrev="kq2"

if [ ${CARCH}=x86_64 ]
  then
    _winedir="drive_c/Program\ (\x86\)/AGD\ Interactive/King\'s\ Quest\ II"
  else
    _winedir="drive_c/Program\ Files/AGD\ Interactive/King\'s\ Quest\ II"
fi

_icon="$_winedir/kq2menu.ico"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	mv $srcdir/"countdl.php?action=download&game=12" $srcdir/Kq2vga31c.exe
	mkdir -p -m755 $srcdir/.tmp
	WINEPREFIX=$srcdir/.tmp/ wine $srcdir/Kq2vga31c.exe
}

package() {
	cp -ar $srcdir/.tmp/* "$pkgdir/opt/abandonia/$_pkgabbrev"

	#ok, let's use a script to start the game
        #script also include union mount in order to enable multi-user playing of this game from a single install.

	mkdir -p -m755 /$pkgdir/usr/bin/ 

	printf "#!${SHELL}
		mkdir -p ~/.abandonia/$_pkgabbrev/persistent
		mkdir -p ~/.abandonia/$_pkgabbrev/temp
		unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/persistent=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
		cd ~/.abandonia/$_pkgabbrev/temp/$_winedir
		WINEPREFIX=~/.abandonia/$_pkgabbrev/temp wine Launcher.exe
		cd ~/
		fusermount -u ~/.abandonia/$_pkgabbrev/temp
	" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 

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
