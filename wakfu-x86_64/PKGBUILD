# Maintainer: x4fyr <benedikt_v@web.de>
# Changed from wakfu from p2k
pkgname=wakfu-x86_64
pkgver=1.0
pkgrel=2
pkgdesc="A turn-based tactical Massively Multiplayer Online Role-playing Game (MMORPG) written in Java/OpenGL."
url="http://www.wakfu.com/"
license="custom"
arch=('x86_64')
provides=wakfu
replaces=wakfu
source=("http://dl.ak.ankama.com/games/installers/wakfu-amd64.tar.gz" "http://fc04.deviantart.net/fs71/i/2012/043/f/e/wakfu_game_icon_by_math0ne-d4pj6q5.png" "Wakfu.desktop")
depends=('libpng12')
install=wakfu.install
md5sums=('8437458fe1b43b6418b5e5e2f41efadc' '62d2839e5b854b8422f46ed43b12b605' 'ed013eba56eea96d9212787ed49ad84c')
options=(!strip)

package() {
  msg2 "Installing wakfu-launcher..."
  install -d "$srcdir/wakfu/" "$pkgdir/opt/wakfu/"
  cp -a $srcdir/wakfu/* $pkgdir/opt/wakfu
  chgrp -R users "$pkgdir/opt/wakfu"
  chmod -R 775 "$pkgdir/opt/wakfu"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "$pkgdir/opt/wakfu/wakfu" "$pkgdir/usr/bin/wakfu"

  msg2 "Installing menu icon..."
  install -m 775 -g users "$srcdir/wakfu_game_icon_by_math0ne-d4pj6q5.png" "$pkgdir/opt/wakfu/icon.png"
  mkdir -p "$pkgdir/usr/share/applications"
  install -m 775 "$srcdir/Wakfu.desktop" "$pkgdir/usr/share/applications/"
}
# vim:set ts=2 sw=2 et:
