# Contributor: Sam101 <lepetit.samuel@gmail.com>
pkgname=massimageconverter
pkgver=20110927
pkgrel=2
pkgdesc="A parallel image converter, with a friendly GUI. Use imagemagick"
arch=('i686', 'x86_64')

depends=('qt' 'imagemagick')
makedepends=('git')	
source=()
md5sums=()
license=('GPL3')
url="http://github.com/sam101/MassImageConverter"
_gitroot="https://github.com/sam101/MassImageConverter.git"
_gitname="MassImageConverter"

build() 
{
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
		cd "$_gitname"

	fi

	msg "GIT checkout done or server timeout"	

	qmake
	make clean
	make
	
	mkdir -p $pkgdir/usr/bin
	cp massimageconverter $pkgdir/usr/bin
}
