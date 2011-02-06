# Contributor: Testuser_01 <siebler_n@gmx.de>

pkgname="quake3-excessiveplus-beta"
pkgver="1.04b6"
_pkgver="1.04-beta6"
pkgrel=1
pkgdesc="Excessive Plus is a modification for Quake 3 where all weapons are 'excessive'. This is the latest beta version. If you had earlier versions installed, please be aware that your old config will probably be updated once you start the game!"
url="http://www.excessiveplus.net/"
arch=('i686' 'x86_64')
license='unknown'
depends=('quake3')
conflicts=('quake3-excessiveplus')
replaces=('quake3-excessiveplus')
install="quake3-excessiveplus-beta.install"
source=(
	"http://www.excessiveplus.net/downloads/xp-$_pkgver.zip"
)
md5sums=(
	'f0c601d2aa08649c81a591e1893a3e3e'
)

build() {
	cd $startdir/src/ || return 1
	mkdir -p $startdir/pkg/opt/quake3/ || return 1
	cp -ar excessiveplus $startdir/pkg/opt/quake3/ || return 1
}
