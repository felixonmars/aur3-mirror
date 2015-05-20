# Maintainer: you, if you want
# Contributor: Emanuel Guével (PotatoesMaster) <guevel.emanuel at gmail dot com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=klystron-git
pkgver=468.42442ce
pkgrel=1
pkgdesc="A framework for a Thrust clone"
arch=('i686' 'x86_64')
url="https://github.com/kometbomb/klystron/"
license=('MIT')
makedepends=('git')
provides=('klystron')

source=('git+https://github.com/kometbomb/klystron.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/klystron"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/klystron"

  sed -i -e "s|bin.\$(CFG)\/ksnd.dll| |g" Makefile
  sed -i -e "s|\@dlltool|#|g" Makefile
  sed -i -e "s|include \"SDL_RWops.h\"|include \"SDL_rwops.h\"|g" src/snd/music.h

  ## no need to build it, we only install it to make other packages...
  #make build
}

package() {
  mkdir -p "$pkgdir/usr/share/klystron"

# cp -fr "$srcdir/klystron/bin.debug/" "$pkgdir/usr/share/klystron"
  cp -fr "$srcdir/klystron/src/"       "$pkgdir/usr/share/klystron"
  cp -fr "$srcdir/klystron/tools/"     "$pkgdir/usr/share/klystron"
# cp -fr "$srcdir/klystron/deps/"      "$pkgdir/usr/share/klystron"
  cp -fr "$srcdir/klystron/Makefile"   "$pkgdir/usr/share/klystron"
}
