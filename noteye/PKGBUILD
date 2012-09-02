# Maintainer: Eric Forgeot - http://esclinux.tk
pkgname=noteye
pkgver=5.9
pkgrel=1
pkgdesc="Necklace of the Eye: a frontend to modify the output of console and libtcod roguelikes (especially for Hydra Slayer)."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/noteye.php"
license=('GPL2')
depends=('ncurses' 'gcc-libs' 'lua')
source=(http://www.roguetemple.com/z/noteye-59.zip)
md5sums=('f5f0cb33707308059e0d975df5cd203a')


build() {
  mkdir -p $pkgdir/usr/share/noteye || return 1
  mkdir -p $pkgdir/usr/bin || return 1
  cd $srcdir/noteye/src
  sed -i -e "s|lua5.1/||g" noteye.h
  sed -i -e "s|llua5.1|llua|g" Makefile
  
  make
  cp $srcdir/noteye/src/noteye $srcdir/noteye/
  cd $srcdir/noteye/hydra
  make
}

package() {

  cp -fr "$srcdir/noteye" "$pkgdir/usr/share/"

  chown -R :games $pkgdir/usr/share/noteye
  chmod -R g+srw $pkgdir/usr/share/noteye
  
  echo "cd /usr/share/noteye
  ./noteye" > $pkgdir/usr/bin/noteye
  chmod +x $pkgdir/usr/bin/noteye
}

