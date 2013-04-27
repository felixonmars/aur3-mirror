# Maintainer: Emanuel Guével (PotatoesMaster) <guevel.emanuel at gmail dot com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=klystron
pkgver=396
pkgrel=3
pkgdesc="A framework for a Thrust clone"
arch=('i686' 'x86_64')
url="http://code.google.com/p/klystron/"
license=('MIT')
makedepends=('subversion')

build() {
  cd "$srcdir"

  svn co -r ${pkgver} http://klystron.googlecode.com/svn/trunk/ "$pkgname"

  msg 'SVN checkout done or server timeout'

  cd "$pkgname"

  sed -i -e "s|bin.\$(CFG)\/ksnd.dll| |g" Makefile
  sed -i -e "s|\@dlltool|#|g" Makefile
  sed -i -e "s|include \"SDL_RWops.h\"|include \"SDL_rwops.h\"|g" src/snd/music.h

  ## no need to build it, we only install it to make other packages...
  #make build
}

package() {
  mkdir -p "$pkgdir/usr/share/klystron"

# cp -fr "$srcdir/${pkgname}/bin.debug/" "$pkgdir/usr/share/klystron"
  cp -fr "$srcdir/${pkgname}/src/" "$pkgdir/usr/share/klystron"
  cp -fr "$srcdir/${pkgname}/tools/" "$pkgdir/usr/share/klystron"
# cp -fr "$srcdir/${pkgname}/deps/" "$pkgdir/usr/share/klystron"
  cp -fr "$srcdir/${pkgname}/Makefile" "$pkgdir/usr/share/klystron"
}
