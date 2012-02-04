# Contributor: Eric Knecht unreal.geek@gmail.com

pkgname=kzenexplorer
pkgver=0.6 
pkgrel=2
pkgdesc="KZenExplorer allows to manage the tracks and playlist on any mp3 player supported by libnjb"
arch=('i686')
url="http://kzenexplorer.sourceforge.net/"
license="GPL"
depends=('libnjb' 'taglib' 'kdelibs')
source=(http://dl.sourceforge.net/sourceforge/kzenexplorer/kzenexplorer-0.6.tar.bz2)
md5sums=('42554450bd591f2bb881e7b07c7790b2')

build()
{
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
