# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod-beta
_pkgname=libtcod
pkgver=1.5.1
pkgrel=6
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="http://doryen.eptalys.net/libtcod/"
license=('BSD')
depends=('libpng' 'sdl' 'zlib' 'libgl')
provides=('libtcod')
source=(http://doryen.eptalys.net/?file_id=26
        http://bitbucket.org/jice/libtcod/raw/bf1077b273d8/makefiles/makefile-linux64
        http://bitbucket.org/jice/libtcod/raw/bf1077b273d8/makefiles/makefile-linux)
md5sums=('41e953693c7748e521b198a89003c07a'
         '7578525cc8431153582eb62ffd6bffcb'
         '84b6dfbe96eab91b3b513d4f9e8dc81e')

build() {
   tar -zxvf "?file_id=26"

   cd "$srcdir/$_pkgname-$pkgver"

   if test "$CARCH" == x86_64; then
      cp ../../makefile-linux64 makefiles/
      make -f makefiles/makefile-linux64 release TEMP=$pkgdir/tmp/
   else
      cp ../../makefile-linux makefiles/
      make -f makefiles/makefile-linux release TEMP=$pkgdir/tmp/
   fi

   mkdir -p $pkgdir/usr/lib
   mkdir -p $pkgdir/usr/include/$_pkgname

   install -D -m 644 libtcod{,gui,xx}.so $pkgdir/usr/lib/
   install -D -m 644 include/*.h* $pkgdir/usr/include/$_pkgname/
}

# vim:set ts=2 sw=2 et:
