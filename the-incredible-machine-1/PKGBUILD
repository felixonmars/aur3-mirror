# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
pkgname=the-incredible-machine-1
pkgver=1.0
pkgrel=7
pkgdesc="A classic puzzle game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/25/Incredible+Machine,+The.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install=tim1.install
depends=('dosbox' 'unionfs-fuse')
optdepends=('abandonia-menu')
# http://files.abandonia.com/download.php?game=Incredible+Machine%2C+The&secure=9a8dc34c7f16385cd192f49e166c3e31&td=1297653970
source=('Incredible Machine, The.zip' 'TIM.gif')
sha256sums=('6773e230efb8a7e1fe69a4f09891ff44faaeb7621f4a521e24cb1ee8d16166c6'
            'd0f8ab7c6147700a705127e83adff69482b8404c4b66e42c26f4429aae960f44')
_pkgabbrev="TIM1"
_exe="TIM.EXE"
_icon="TIM.gif"

package() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

	#ok, let's use a script to start the game

	mkdir -p -m755 $pkgdir/usr/bin/ 
	printf "#!${SHELL}
if whereis unionfs-fuse>/dev/null 2>&1;
    then
	if whereis dosbox>/dev/null 2>&1;
		then
			mkdir -p ~/.abandonia/$_pkgabbrev/temp
			mkdir -p ~/.abandonia/$_pkgabbrev/persistent
			unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/persistent=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
			dosbox ~/.abandonia/$_pkgabbrev/temp/$_exe
			fusermount -u ~/.abandonia/$_pkgabbrev/temp
		else
			echo '==> Please get sure to have dosbox installed and have it in your PATH array.'
	fi
    else
	echo '==> Please make sure to have unionfs-fuse installed and in your PATH.'
fi" >> $pkgdir/usr/bin/$_pkgabbrev.sh 
	chmod +x $pkgdir/usr/bin/$_pkgabbrev.sh 
	ln -s $_pkgabbrev.sh $pkgdir/usr/bin/$_pkgabbrev


	# Automatic generation of a .desktop file

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
