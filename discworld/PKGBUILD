# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="discworld"
pkgver="1.0"
pkgrel=7
pkgdesc="A classic adventure game from Abandonia, played in ScummVM."
url='http://www.abandonia.com/en/games/878/Discworld.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='discworld.install'
depends=('scummvm')
makedepends=('dosbox')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Discworld&secure=b8ccf50cc13de6e4f333e2469df4a201&td=1297693940' 'discworld.jpg')
md5sums=('c74b28e6cab2fb51dbc41701a92fe63b' '038f2e32f04b09d1b157a1a2d14e5b68')
_pkgabbrev="discworld"
_exe="DW"
_icon="discworld.jpg"

build() {
	rm -f $srcdir/download*

        echo "Do not worry, after setup just type"
        echo "exit"
        echo "at the DOS prompt to continue with the packaging"
        dosbox $srcdir/INSTALL.EXE
}

package() {
	mkdir -p -m755 "$pkgdir/opt/"
	mkdir -p -m755 "$pkgdir/opt/abandonia"
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev"

	cp -ar $srcdir/DISCWLD/* "$pkgdir/opt/abandonia/$_pkgabbrev"
        cp -ar $srcdir/$_icon $pkgdir/opt/abandonia/$_pkgabbrev

	#ok, let's use a script to start the game
	#change -F to -f if you want the game to run in full-screen as default.

	mkdir -p -m755 /$pkgdir/usr/bin/

        chmod -R 755 $pkgdir/opt/abandonia/$_pkgabbrev/

	printf "#!${SHELL}
if whereis scummvm>/dev/null 2>&1;
	then
		mkdir -p ~/.abandonia/$_pkgabbrev
		scummvm -F --savepath=~/.abandonia/$_pkgabbrev --path=/opt/abandonia/$_pkgabbrev/ $_exe
	else
		echo '==> Please get sure to have ScummVM installed and have it in your PATH array.'
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
