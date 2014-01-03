# Maintainer: 404
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: zoulnix <http://goo.gl/HQaP>

pkgname=smashbattle
pkgver=110224
pkgrel=1
pkgdesc="8-bit style game where two player face off against each other."
arch=('i686' 'x86_64')
url="http://smashbattle.demontpx.com"
license=('GPL')
depends=('sdl_mixer')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.zip")
md5sums=('23b7e49549fdf3f0d8713c9953b7f728')
install="$pkgname.install"

prepare() {
  cd battle/Battle

  # fix launcher paths
  sed -i 's|/usr/share/games/smashbattle/gfx/SB.png|smashbattle|' linux/smash*.desktop
  sed -i 's|/usr/local/bin/||' linux/smash*.desktop
  sed -i 's|/games/|/|' linux/smashbattle
  sed -i 's|bash|sh|' linux/smashbattle

  # fix sdl include/libs and add our makeflags
  sed -i 's|CFLAGS=|CFLAGS += $(shell sdl-config --cflags) |' Makefile
  sed -i 's|LDFLAGS=-lSDL|LIBS = $(shell sdl-config --libs) |' Makefile
  sed -i 's|$(OBJS) -o battle|$(OBJS) $(LIBS) -o battle|' Makefile
}

build() {
  cd battle/Battle

  make
}

package() {
  cd battle/Battle

  # create directories and copy files
  install -d "$pkgdir"/usr/share/{applications,$pkgname/{gfx,music,sfx,stage}}
  install -m755 battle "$pkgdir"/usr/share/$pkgname/
  install -Dm755 linux/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -m644 linux/$pkgname*.desktop "$pkgdir"/usr/share/applications/
  install -Dm644 gfx/SB.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -m644 gfx/*.bmp "$pkgdir"/usr/share/$pkgname/gfx/
  install -m644 music/*.ogg "$pkgdir"/usr/share/$pkgname/music/
  install -m644 sfx/*.wav "$pkgdir"/usr/share/$pkgname/sfx/
  install -m644 stage/*.lvl "$pkgdir"/usr/share/$pkgname/stage/

  # fix group permission for save support
  chgrp games "$pkgdir"/usr/share/$pkgname
  chmod g+w "$pkgdir"/usr/share/$pkgname
}
