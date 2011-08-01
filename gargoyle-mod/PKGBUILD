# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=gargoyle-mod
pkgver=20080421
pkgrel=3
pkgdesc="interactive fiction multi-interpreter, based on gargoyle. "
arch=(i686 x86_64)
#url="http://ccxvii.net/gargoyle/"
url="http://www.logossrl.com/gargoyle-mod/gargoyle_mod_it.html"
license=('GPL')
depends=('gtk' 'sdl_mixer' 'sdl_sound' 'libvorbis' 'freetype2')
#sdl_image ? sdl_sound
makedepends=('ftjam' 'pkgconfig' 'nana' 'libotf-cvs')
source=(http://www.logossrl.com/gargoyle-mod/gargoyle-2007-09-03-mod-04-src.tar.bz2)

md5sums=(3d1889f10f5e1bfe8d85e47d1b67baa7)

build() {
  cd $startdir/src/gargoyle-2007-09-03-mod-04
  #./configure --prefix=/usr
  mv Readme.txt.orig Readme.txt
  jam ||return 1
  jam install || return 1
 #makedist.sh
mkdir -p $startdir/pkg/usr/share/gargoyle-mod/
mkdir -p $startdir/pkg/usr/bin
mkdir -p $startdir/pkg/usr/lib
 install $startdir/src/gargoyle-2007-09-03-mod-04/build/dist.linux.release/* $startdir/pkg/usr/share/gargoyle-mod/
 mv  $startdir/pkg/usr/share/gargoyle-mod/libgarglk.so $startdir/pkg/usr/lib/
 ln -s /usr/share/gargoyle-mod/gargoyle $startdir/pkg/usr/bin/gargoyle-mod
  #make || return 1
  #make DESTDIR=$startdir/pkg install || return 1
}

