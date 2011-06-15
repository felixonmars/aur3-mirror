# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="death-rally"
pkgver="1.0"
pkgrel=4
pkgdesc="A free windows port of the classic racing game from Remedy games, played in Wine."
url='http://www.abandonia.com/en/games/28518/Death+Rally.html'
arch=('i686' 'x86_64')
license=('custom-freeware')
install='death-rally.install'
depends=('wine' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('http://www.remedygames.com/files/DeathRallyWin_10.exe')
md5sums=('81584602e6f809817e62cbce89178727')
_pkgabbrev="deathrally"

if [ ${CARCH} = x86_64 ]
  then
    _winedir="drive_c/Program\ (\x86\)/Death\ Rally/"
  else
    _winedir="drive_c/Program\ Files/Death\ Rally/"
fi

_exe="dr.exe"
_icon="$_winedir/DR.ICO"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 

	WINEPREFIX=$srcdir/.tmp/ wine $srcdir/DeathRallyWin_10.exe

}

package() {
	
	cp -ar $srcdir/.tmp/* $pkgdir/opt/abandonia/$_pkgabbrev

	#ok, let's use a script to start the game
        #script also include union mount in order to enable multi-user playing of this game from a single install.

	mkdir -p -m755 /$pkgdir/usr/bin/ 

	printf "#!${SHELL}
		mkdir -p ~/.abandonia/$_pkgabbrev/temp
		mkdir -p ~/.abandonia/$_pkgabbrev/persistent
		unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/persistent=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
		cd ~/.abandonia/$_pkgabbrev/temp/$_winedir
		WINEPREFIX=~/.abandonia/$_pkgabbrev/temp/ wine $_exe
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
