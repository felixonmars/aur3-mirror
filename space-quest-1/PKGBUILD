# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=space-quest-1
pkgver=1.0
pkgrel=3
pkgdesc="Classic adventure game from Abandonia, played in DosBox"
url='http://www.abandonia.com/en/games/129/Space+Quest+-+The+Sarien+Encounter.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install=spaceq1.install
depends=('dosbox')
optdepends=('abandonia-menu')
# http://files.abandonia.com/download.php?game=Space+Quest+-+The+Sarien+Encounter&secure=3ceb951d476596aad1556fd874fa8c30&td=1298706721
source=('Space Quest - The Sarien Encounter.zip' 'spaceq1.gif')
sha256sums=('a6ea0853cb38aa4fd77dc37510fef68cce3b17a1c73be63f630910f836d0c8cb'
            '66536294fe93cffc923e78eeee5d5d943d27ae86f0cf38c6e99d4e31d4a311c7')
_pkgabbrev="spaceq1"
_exe="SQ.COM"
_icon="spaceq1.gif"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia"
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev"

	cp -ar $srcdir/Space\ Quest\ 1.1987/* "$pkgdir/opt/abandonia/$_pkgabbrev"
	cp -ar $srcdir/$_icon "$pkgdir/opt/abandonia/$_pkgabbrev"

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/

	printf "#!${SHELL}
mkdir -p ~/.abandonia/$_pkgabbrev

if whereis dosbox>/dev/null 2>&1;
	then
		dosbox /opt/abandonia/$_pkgabbrev/$_exe mount c ~/.abandonia/$_pkgabbrev
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
