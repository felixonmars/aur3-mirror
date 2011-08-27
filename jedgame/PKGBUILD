# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Sebastien Duthil <duthils@free.fr>
pkgname=jedgame
pkgver=1.00
pkgrel=3
pkgdesc='A fun "new-retro" platform game'
arch=('i686' 'x86_64')
url="http://jonathanwhiting.com/blog/?p=13"
license=(unknown)
[[ $CARCH == 'i686' ]] && depends=(mesa sdl sdl_mixer)
[[ $CARCH == 'x86_64' ]] && depends=(lib32-mesa lib32-sdl lib32-sdl_mixer)
source=(http://jonathanwhiting.com/coding/${pkgname:0:3}_${pkgver/./_}.zip)
md5sums=('dcf1a72d0e9041cef091329e1a4689cf')

build() {
  :
}

package() {
  install -Dm755 "$srcdir/jed/jed" "$pkgdir/usr/share/jed/jed"
  _target="$pkgdir/usr/share"
  for file in $srcdir/jed/sound/* $srcdir/jed/gfx/* $srcdir/jed/levels/*; do
    install -Dm644 "$file" "${file/$srcdir/$_target}"
  done
  echo $'#!/bin/bash\ndir=~/.jed\n[ -d $dir ] || mkdir $dir\ncd $dir\n[ -f jed ] || for d in /usr/share/jed/*; do ln -s $d; done\n./jed' >"$srcdir/execute"
  install -Dm755 "$srcdir/execute" "$pkgdir/usr/bin/jed"
}
