# Contributor: WFCody
# Contributor: Nicolas Barbey <nicolas.a.barbey@gmail.com>

pkgname="reunion-1"
pkgver="1.0"
pkgrel=5
pkgdesc="A classic sci-fi strategy game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/150/Reunion.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='reunion.install'
depends=('dosbox' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Reunion&secure=07cdba8f0450ca77c4c85be721ac5d80&td=1298304936')
md5sums=('f1f3c2734d3eff59b6d47dd64f70d66c')
_pkgabbrev="reunion"
_exe="start.exe"
_icon="/ICON/ICONMAIN.PIC"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/ 

	printf "#!${SHELL}
if whereis unionfs-fuse>/dev/null 2>&1;
  then
    if whereis dosbox>/dev/null 2>&1;
	then
		mkdir -p ~/.abandonia/$_pkgabbrev/persistent
		mkdir ~/.abandonia/$_pkgabbrev/temp
		unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/persistent=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
		dosbox ~/.abandonia/$_pkgabbrev/temp/$_exe
		fusermount -u ~/.abandonia/$_pkgabbrev/temp
	else
		echo '==> Please get sure to have dosbox installed and have it in your PATH array.'
    fi
  else
    echo '==> Please get sure to have unionfs-fuse installed and have it in your PATH array.'
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
