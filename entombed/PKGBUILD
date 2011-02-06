# Contributor: Benjamin Debski <benjamin.debski@gmail.com>

pkgname=entombed
pkgver=2007.07.04
pkgrel=1
pkgdesc="Entombed is a one or two-player maze game based on the classic Atari 2600 game"
arch=('i686')
url="http://www.newbreedsoftware.com/entombed/"
license=('GPL')

depends=('sdl' 'sdl_image' 'sdl_mixer')
makedepends=()

source=(ftp://ftp.billsgames.com/unix/x/entombed/entombed-$pkgver.tar.gz)
md5sums=(4d2cf6c6386e58681df342512f8d4e0e )

build() {
	cd $startdir/src/entombed-$pkgver
	make || return 1
	
	mkdir -p $startdir/pkg/usr/bin
	mv entombed $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/local/share
	mv data $startdir/pkg/usr/local/share/entombed
	
	chmod -R a+rX,g-w,o-w $startdir/pkg/usr/local/share/entombed
	chmod a+rx,g-w,o-w $startdir/pkg/usr/bin/entombed
}