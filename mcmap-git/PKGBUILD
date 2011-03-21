
# Maintainer: Aaron Dalton <aarondalton713@gmail.com>
pkgname=mcmap-git
pkgver=20110314
pkgrel=1
pkgdesc="A tiny map visualizer for Minecraft."
arch=('i686' 'x86_64')
url="http://www.minecraftforum.net/viewtopic.php?f=25&t=40327"
license=('unknown')
depends=('zlib' 'libpng')
makedepends=('git')

_gitroot=https://github.com/Zahl/mcmap.git
_gitname=mcmap

build() {
  cd "$srcdir"
  
  if [ -d $_gitname ]; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
  fi
  
  cd $_gitname
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/$_gitname/mcmap $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
