# Maintainer : echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: lele85 <emanuele.rampichini@gmail.com>

pkgname=posterazor
pkgver=1.9.6beta
pkgrel=5
pkgdesc="PosteRazor cuts a raster image into pieces which can be printed and assembled to a poster."
arch=('i686' 'x86_64')
url="http://posterazor.sourceforge.net/"
license=('GPL')
depends=('qt4>=4.8.4-12')
source=(http://stashbox.org/1180899/posterazor-1.9.6-git.tar.gz $pkgname.desktop $pkgname.xpm)
md5sums=('9ed418afdb88b2e9c74ca76cfeebe206'
         '695f169e4ab848ac82e15d048f0556b4'
		 'e537f05051d6b8f0b5d11d6bff042578')

build() {
	cd $startdir/src/posterazor/src
	sed -i 's/lrelease/&-qt4/' posterazor.pro
	qmake-qt4 posterazor.pro
	make VERBOSE=1 || return 1

	#Install binary
}
package() {
	cd $startdir/src/posterazor/src
	install -Dm755 PosteRazor $pkgdir/usr/bin/posterazor

	#Install .desktop and icon
	install -Dm644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $startdir/$pkgname.xpm $pkgdir/usr/share/icons/$pkgname.xpm
}
