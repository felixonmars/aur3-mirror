# Maintainer: Mickaël FALCK <lastmikoi@gmail.com>
# Very highly inspired by cataclism-git package,
# maintained by keenerd at gmail dot com
pkgname=cataclysm-git-sdl
pkgver=20131017
pkgrel=1
pkgdesc="A post-apocalyptic roguelike. SDL version, with tile support."
#url="http://cataclysmrl.blogspot.com/"
#url="http://www.cataclysm.glyphgryph.com/"
url="http://en.cataclysmdda.com/"
arch=('i686' 'x86_64')
license="copyright"
# todo, Creative Commons Attribution-ShareAlike 3.0 Unported License
depends=('ncurses' 'sdl' 'sdl_ttf')
makedepends=('git')
install=cataclysm-git.install
source=(cataclysm-git.install)
md5sums=('9b048cbaa2588b9e81ff91f6fc6f665c')

# whales's version
#_gitroot="git://github.com/Whales/Cataclysm.git"
#_gitname="Cataclysm"

# community fork
#_gitroot="git://github.com/TheDarklingWolf/Cataclysm-DDA.git"
#_gitname="Cataclysm-DDA"

# new community fork
_gitroot="git://github.com/CleverRaven/Cataclysm-DDA.git"
_gitname="Cataclysm-DDA"

build() {
  cd "$srcdir"
  msg "Connecting to github..."

  if [ -d "$srcdir"/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"

  sed -i 's|"data/|"/usr/share/cataclysm/data/|g' *.cpp
  sed -i 's|"./data/|"/usr/share/cataclysm/data/|g' *.cpp
  sed -i 's|"data"|"/usr/share/cataclysm/data"|g' *.cpp
  sed -i 's|"save"|"/var/games/cataclysm/save"|g' {game,map,overmap,mapbuffer,main_menu,itypedef}.cpp
  sed -i 's|"save/|"/var/games/cataclysm/save/|g' {game,map,overmap,mapbuffer,main_menu,itypedef}.cpp
  sed -i 's|"gfx"|"/usr/share/cataclysm/gfx"|g' {sdltiles,cata_tiles}.cpp
  sed -i 's|"gfx/|"/usr/share/cataclysm/gfx/|g' {sdltiles,cata_tiles}.cpp
#  sed -i 's|^data/|/usr/share/cataclysm/data/|g' data/fontlist.txt

  sed -i 's|JSON: gfx|JSON: /usr/share/cataclysm/gfx|g' gfx/*/tileset.txt
  sed -i 's|TILESET: gfx|TILESET: /usr/share/cataclysm/gfx|g' gfx/*/tileset.txt

  # someday...
  #sed -i '1i #include <stdio.h>' {game,map,overmap}.cpp
  #sed -i 's|"save/|getenv("HOME") << "/.cataclysm/save/|g' *.cpp

  make PREFIX=/usr TILES=1
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 cataclysm-tiles "$pkgdir/usr/bin/cataclysm-tiles"
  install -dm774 -g games  "$pkgdir/usr/share/cataclysm/data"
  cp -r data/* "$pkgdir/usr/share/cataclysm/data"
  install -dm774 -g games  "$pkgdir/usr/share/cataclysm/gfx"
  cp -r gfx/* "$pkgdir/usr/share/cataclysm/gfx"
  install -dm774 -g games  "$pkgdir/usr/share/cataclysm/obj"
  cp -r obj/* "$pkgdir/usr/share/cataclysm/obj"
  install -dm774 -g games "$pkgdir/var/games/cataclysm/save"
}
