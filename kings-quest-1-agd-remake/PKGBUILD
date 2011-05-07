# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="kings-quest-1-agd-remake"
pkgver="4.1c"
pkgrel=3
pkgdesc="A free windows port of the classic adventure game from Abandonia, played in Wine."
url=('http://www.abandonia.com/en/games/168/Kings+Quest+-+Quest+for+the+Crown+VGA.html' 'http://www.agdinteractive.com/games/kq1/about/about.html')
arch=('i686' 'x86_64')
license=('custom-freeware' 'Abandonware')
install='kq1.install'
depends=('wine' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('http://agdinteractive.com/countdl.php?action=download&game=11')
md5sums=('c025ccce5d1cf817140a520e7806bb62')
_pkgabbrev="kq1"

if [ ${CARCH}=x86_64 ]
  then
    _winedir="drive_c/Program\ \(x86\)/AGD\ Interactive/King\'s\ Quest\ I/"
  else
     _winedir="drive_c/Program\ Files/AGD\ Interactive/King\'s\ Quest\ I/"
fi

_icon="$_winedir/kq1menu.ico"


build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	mv $srcdir/"countdl.php?action=download&game=11" $srcdir/Kq1vga41c.exe
	mkdir -p m755 $srcdir/.tmp
	WINEPREFIX=$srcdir/.tmp/ wine $srcdir/Kq1vga41c.exe
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
		WINEPREFIX=~/.abandonia/$_pkgabbrev/temp/ wine Launcher.exe
		cd ~/
		fusermount -u ~/.abandonia/$_pkgabbrev/temp/
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
