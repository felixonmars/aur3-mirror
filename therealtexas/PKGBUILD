# Maintainer: xkero <sinister.ray@gmail.com>
pkgname=therealtexas
pkgver=1.3_1
_pkgver=1.3-1
pkgrel=3
pkgdesc="The Real Texas is an action adventure game that plays like a mashup of Zelda: Link to the Past and Ultima VI."
url="http://therealtexasgame.com/"
arch=('x86_64' 'i686')
case $CARCH in
	i686)   depends=('mesa'       'sdl'       'gtk2'       'glu') ;;
	x86_64) depends=('lib32-mesa' 'lib32-sdl' 'lib32-gtk2' 'lib32-glu') ;;
esac
groups=('games')
license=('custom')
source=("${pkgname}_${_pkgver}_i386.deb")
md5sums=('9c0824d84464d0a5bcb1b4792d404776')

package()
	{
	cd "$srcdir"
	ar tv "$source"
	bsdtar -C "$pkgdir" -xvf data.tar.gz --exclude md5sums
	}

