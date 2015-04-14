# Maintainer: kaptoxic <kaptoxic [at] yahoo [dot] com>
# Contributor: josomebody

pkgname=k-robots
pkgver=0.5.0
pkgrel=1
pkgdesc="An independent Linux implementation of the AT-Robots 2 programming game, where different robot tanks that run assembly-type programs supplied by the players compete in an arena to be the last one standing"
arch=('i686' 'x86_64')
url="http://munsterhjelm.no/km/K-Robots/"
license=('GPLv3')
depends=(sdl sdl_gfx sdl_ttf)
source=('http://freecode.com/urls/4a550947e991172812f306b8cf888f1b')
md5sums=('02ef7bbcf3d985d5bb58a72fffccfa99')

build() {
  cd "$srcdir"
  rm krobots
  #cat main.cc | sed s/freetype/TTF/ > main.cc
  sed -i s/freetype/TTF/ main.cc
  make || return 1
}

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/opt/k-robots
  mkdir -p $pkgdir/usr/bin
  cp krobots $pkgdir/opt/k-robots
  cp -r backup $pkgdir/opt/k-robots
  cp -r cpu $pkgdir/opt/k-robots
  cp -r example_robots $pkgdir/opt/k-robots
  cp -r test_robots $pkgdir/opt/k-robots
  echo "#! /bin/bash" > $pkgdir/usr/bin/krobots
  echo "/opt/k-robots/krobots \$@" >> $pkgdir/usr/bin/krobots
  chmod 775 $pkgdir/usr/bin/krobots
}

# vim:set ts=2 sw=2 et:
