# Contributor: Slash
# Maintainer: Eric Forgeot < http://ifiction.free.fr >

pkgname=xu4-svn
pkgrealname=xu4
pkgver=2900
pkgrel=2
pkgdesc="A recreation of the classic computer RPG Ultima IV for modern operating systems."
arch=(i686 x86_64)
url="http://xu4.sourceforge.net/"
license=('gpl')
depends=('sdl' 'sdl_mixer' 'libxml2')
makedepends=('subversion' 'imagemagick')
#provides=()
#conflicts=()
source=(http://www.ultima-universe.com/downloads/ultima4v101.zip)
md5sums=('9e49af437eb85024c8d1c2c3ae871c07')

_svntrunk=https://xu4.svn.sourceforge.net/svnroot/xu4/trunk/u4
_svnmod=xu4

build() {
	
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done (or server timeout)"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/src

        sed -i '7i\#include <stdint.h>' $srcdir/xu4-build/src/image.h
	sed -i 's\sound_SDL.h\sound_sdl.h\1' $srcdir/xu4-build/src/sound_sdl.cpp
	make
	convert xu4.ico xu4.png
	#make DESTDIR=$pkgdir install || return 1
	
	#deploy
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/xu4/ultima4

	cp $srcdir/$_svnmod-build/src/u4dec $pkgdir/usr/share/xu4/
	cp $srcdir/$_svnmod-build/src/u4enc $pkgdir/usr/share/xu4/
	cp $srcdir/$_svnmod-build/src/u4unpackexe $pkgdir/usr/share/xu4/
	cp $srcdir/$_svnmod-build/src/dumpsavegame $pkgdir/usr/share/xu4/
	cp $srcdir/$_svnmod-build/src/tlkconv $pkgdir/usr/share/xu4/
	cp $srcdir/$_svnmod-build/src/coord $pkgdir/usr/share/xu4/
	cp $srcdir/$_svnmod-build/src/u4 $pkgdir/usr/share/xu4/
	cp $srcdir/ULTIMA4/* $pkgdir/usr/share/xu4/ultima4
	
	cp -fr $srcdir/$_svnmod/* $pkgdir/usr/share/xu4/
	rm -fr $pkgdir/usr/share/xu4/src
	rm -fr $pkgdir/usr/share/xu4/.svn
	rm -fr $pkgdir/usr/share/xu4/.cvsignore
	rm -fr $pkgdir/usr/share/xu4/conf/.svn
	rm -fr $pkgdir/usr/share/xu4/doc/.svn
	rm -fr $pkgdir/usr/share/xu4/graphics/.svn
	rm -fr $pkgdir/usr/share/xu4/icons/.svn
	rm -fr $pkgdir/usr/share/xu4/mid/.svn
	rm -fr $pkgdir/usr/share/xu4/sound.svn
	rm -fr $pkgdir/usr/share/xu4/vc6

	
	
	echo "cd /usr/share/xu4
./u4" > $pkgdir/usr/bin/xu4

	chmod +x $pkgdir/usr/bin/xu4

 #desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/$_svnmod-build/src/${pkgrealname}.png $pkgdir/usr/share/pixmaps/$pkgrealname.png
	cp $srcdir/../$pkgrealname.desktop $pkgdir/usr/share/applications/
	
	#Clean svn folders
	
	find $pkgdir -type d -name '.svn' | xargs rm -rf
}


