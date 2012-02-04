# Contributor:	rabyte		<gmail.com: rabyte     >
# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>

pkgname=freebasic-fbhelp
pkgver=0.8b
pkgrel=1
pkgdesc="A free BASIC compiler - fbhelp utility"
arch=('i686' 'x86_64')
url="http://www.freebasic.net/"
license=('GPL2' 'LGPL')
depends=('ncurses' 'freebasic')
[ "$CARCH" = "x86_64" ] && depends=('lib32-ncurses')
provides=('fbhelp')
conflicts=()
source=("http://downloads.sourceforge.net/project/fbc/Tools/fbhelp%20v0.8b/fbhelp-v0.8b-src.zip"
	"http://downloads.sourceforge.net/project/fbc/Documentation/FB-manual-0.23.0-fbhelp.zip")

package() {
	cd $srcdir/fbhelp
	OLDTARGET=$TARGET
	export TARGET=linux
	TARGET=linux make -f makefile
	unset TARGET
	export TARGET=$OLDTARGET
	mkdir -p $pkgdir/usr/bin
	mv $srcdir/fbhelp/fbhelp $pkgdir/usr/bin
	TARGET=linux make clean
	mv $srcdir/fbhelp.daz $pkgdir/usr/bin
}

md5sums=('dde53a263ed208371bf671af4b0e52b0'
	'9c145d22bea00d2eb33647a7b83a4836')
