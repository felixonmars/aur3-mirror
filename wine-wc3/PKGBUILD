pkgname=wine-wc3
pkgver=1.1.5
pkgrel=1

pkgdesc="Wine build for Warcraft 3. This package solve problem with host game in the local network, hide and restore game window"
url="http://www.winehq.com"
arch=('i686' 'x86_64')
license=(LGPL)
install=wine-wc3.install

source=(http://snoopy.tuxfamily.org/files/wine-1.1.5-1.1.i386.rpm)
md5sums=('e84467228246dbcf1a66bc7077f81ada')

makedepends=('rpmextract')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('lib32-fontconfig' 'lib32-mesa' 'lib32-libxcursor' 'lib32-libxrandr' 'lib32-libxdamage' 'lib32-libxxf86dga' 'lib32-libxi' 'lib32-alsa-lib' 'desktop-file-utils')
elif [ "${CARCH}" = 'i686' ]; then
depends=('fontconfig' 'mesa' 'libxcursor' 'libxrandr' 'libxdamage' 'libxxf86dga' 'libxi' 'alsa-lib' 'desktop-file-utils')
fi

build() {
	cd $srcdir
	rpmextract.sh wine-1.1.5-1.1.i386.rpm
	mkdir -p $pkgdir/opt/wine-wc3
	cp -aR usr $pkgdir/opt/wine-wc3
}
 
