# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tarinaky <tarinaky@gmail.com>
pkgname=dungeonmonkeyunlimited
pkgver=1.001
pkgrel=2
pkgdesc="A turn based combat-oriented tactics RPG. This game dispenses with all of the boring stuff and jumps straight to the important part: kill the monsters, take their stuff."
arch=(i686 x86_64)
url="http://www.gearheadrpg.com/?p=92"
license=('LGPL2.1')
groups=()
depends=(sdl_ttf sdl_image)
makedepends=(fpc)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://downloads.sourceforge.net/project/dmonkey/v1.000%20Series/DungeonMonkeyUnlimited-1.001-source.zip')
noextract=()

build() {
  cd $srcdir/DMU

  fpc dmu

  touch $srcdir/DMU/AppRun
  echo "#!/bin/bash" >> $srcdir/DMU/AppRun
  echo "cd /usr/share/dungeonmonkeyunlimited || return 1" >> $srcdir/DMU/AppRun
  echo "test -w . || (echo "User must belong to group games to play.";return 1)" >> $srcdir/DMU/AppRun
  echo "exec ./dmu" >> $srcdir/DMU/AppRun

}

package() {
  cd $srcdir/DMU

  mkdir -p $pkgdir/usr/share/dungeonmonkeyunlimited/savegame/
  mkdir -p $pkgdir/usr/bin/

  cp -r $srcdir/DMU/* $pkgdir/usr/share/dungeonmonkeyunlimited/
  cp -l $pkgdir/usr/share/dungeonmonkeyunlimited/AppRun $pkgdir/usr/bin/dungeonmonkeyunlimited

  chgrp -R games $pkgdir/usr/share/dungeonmonkeyunlimited/
  chmod -R g+rw $pkgdir/usr/share/dungeonmonkeyunlimited/
  chmod g+x $pkgdir/usr/bin/dungeonmonkeyunlimited
}

# vim:set ts=2 sw=2 et:

md5sums=('28d1f9d0a35be42674a91a879cdb81cb')
