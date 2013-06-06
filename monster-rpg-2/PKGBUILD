# Maintainer: Jonas Karlsson <jonaskarlsson@fripost.org>
pkgname=monster-rpg-2
pkgver=20130605
pkgrel=2
epoch=
pkgdesc="A console style role playing game (perhaps most accurately, a JRPG)."
arch=('i386' 'x86_64' 'i686')
url="http://www.nooskewl.com"
license=('custom')
groups=()
depends=('allegro-git' 'lua' 'openal' 'curl')
makedepends=('make' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('monster-rpg-2.desktop'
        'http://www.monster-rpg.com/stuff/downloads/monster-rpg-2-src-20130605-2.tar.bz2')
md5sums=('f4161e8b41956b513bfb2f1a6cd62ba9'
         'b918436456c8dfb6942216dd81498824')
noextract=()

build() {
  # sed patching data directory to /usr/share/monster-rpg-2
  cd "$srcdir/monster-rpg-2-src-20130605-2"

  sed "s/sprintf(result,\ \"%s\/data\/\", tmp)/\
       sprintf(result,\ \"\/usr\/share\/monster-rpg-2\/data\/\", tmp)/" \
       -i $srcdir/monster-rpg-2-src-20130605-2/src/util.cpp 

  # sed patching lua5.2 includes to lua
  sed "s/include <lua5.2\//include </" \
      -i $srcdir/monster-rpg-2-src-20130605-2/include/monster2.hpp

  sed "s/lua5.2/lua/" \
      -i $srcdir/monster-rpg-2-src-20130605-2/CMakeLists.txt

  mkdir build
  cd build
  cmake .. -DKCM_AUDIO=on -DUSER_INCLUDE_PATH="/usr/include" \
           -DUSER_LIBRARY_PATH="/usr/lib/"
  make
}

package() {
  cd "$srcdir/monster-rpg-2-src-20130605-2"
  install -D -m755 build/monster2 "${pkgdir}/usr/sbin/monster-rpg-2"

  # Install game files
  mkdir -p "${pkgdir}/usr/share/monster-rpg-2"
  cp -r data "${pkgdir}/usr/share/monster-rpg-2/data"

  # Install a desktop entry
  cd $srcdir
  install -Dm644 monster-rpg-2-src-20130605-2/icon512.png "${pkgdir}/usr/share/pixmaps/monster-rpg-2.png"
  install -Dm644 monster-rpg-2.desktop "${pkgdir}/usr/share/applications/monster-rpg-2.desktop"

  # Install documentation
  install -Dm644 monster-rpg-2-src-20130605-2/README.txt "${pkgdir}/usr/share/doc/$pkgname/README"
  install -Dm644 monster-rpg-2-src-20130605-2/LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
