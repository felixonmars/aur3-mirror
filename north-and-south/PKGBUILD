# Contributor: Testuser_01 <siebler_n@gmx.de>

pkgname="north-and-south"
pkgver="1.0"
pkgrel=2
pkgdesc="The classic game North & South, to be played with DosBox."
url='http://www.abandonia.com/en/games/262/North+%2526+South.html'
arch=('i686' 'x86_64')
install='north-and-south.install'
license='custom-freeware'
depends=('dosbox')
source=(
	"http://files.abandonia.com/download.php?game=North+%26+South&secure=6d7091108a14b0f4f5c7606fa7c4011d&td=1252109330"
)
md5sums=(
	'461e6e4fb6bdfff73a7be6339d324794'
)

build() {
	mkdir -p -m755 "$pkgdir/opt/" || return 1
	rm -f $srcdir/download* || return 1
	cp -ar $srcdir "$pkgdir/opt/north-and-south" || return 1

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/ || return 1
	printf "#!${SHELL}
if whereis dosbox>/dev/null 2>&1;
	then
		dosbox /opt/north-and-south/north.com
	else
		echo '==> Please get sure to have dosbox installed and have it in your PATH array.'
fi
return \$?" >> /$pkgdir/usr/bin/north-and-south.sh || return 1
	chmod +x /$pkgdir/usr/bin/north-and-south.sh || return 1
	ln -s north-and-south.sh /$pkgdir/usr/bin/north-and-south || return 1
}
