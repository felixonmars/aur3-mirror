# Maintainer: Michal Kowalski <kowalski TOD michal TA gmail TOD com>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=goblincamp-hg	
pkgver=2023
pkgrel=1
pkgdesc="Goblin Camp is a roguelike citybuilder, inspired by Anno 1404, Dwarf Fortress and Dungeon Keeper"
arch=('i686' 'x86_64')
url="http://www.goblincamp.com/"
license=('GPL3')
depends=('libgl' 'python2' 'zlib' 'libpng' 'sdl' 'sdl_image' 'gcc-libs')
makedepends=('mercurial' 'boost')
provides=('goblin-camp')
conflicts=('goblin-camp')
#options=(!strip)
source=(goblincamp.desktop goblincamp.png gc-config.jam)
md5sums=('bdaf126929c936bc482a94eb6295c828'
         'a531e29c24395df730ba2277a7a4c212'
         '7ef27d734d82b3b966b1a66c41dab867')

_hgroot="http://bitbucket.org/genericcontainer"
_hgrepo="goblin-camp"
_variant=release
#_variant=debug

build() {
  cd "$srcdir"
  if [ -d $_hgrepo ]; then
    (cd $_hgrepo ; hg pull -ur $pkgver) || return 1
  else
    hg clone -u $pkgver ${_hgroot}/${_hgrepo} || return 1
  fi

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cp ${srcdir}/gc-config.jam .
  bjam --user-config=gc-config.jam variant=${_variant} || return 1
}

package() {
  cd "$srcdir/$_hgrepo-build"

  mkdir -p $pkgdir/usr/{bin,share/{applications,pixmaps}}
  install -m644 $srcdir/goblincamp.desktop $pkgdir/usr/share/applications/goblin-camp.desktop
  install -m644 $srcdir/goblincamp.png $pkgdir/usr/share/pixmaps/goblin-camp.png
  install -m755 build/bin-${_variant}*/bin/goblin-camp $pkgdir/usr/bin/goblin-camp
  cp -r build/bin-${_variant}*/share/goblin-camp* $pkgdir/usr/share
}

