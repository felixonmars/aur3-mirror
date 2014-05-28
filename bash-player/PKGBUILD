# Maintainer: Levi Nachamni (levi0x0)
pkgname=bash-player
pkgver=0.10
pkgrel=1
pkgdesc="A simple GUI for Mplayer/MPV"
url="https://github.com/levi0x0/bash-player"
license=("GPL 3")
arch=('any')
depends=('zenity' 'mplayer')
source=('https://github.com/levi0x0/bash-player/archive/0.10-AUR.tar.gz')
md5sums=('7d29f56e7ec39a1ddda5ba1b05dfe1ce')
pkgvera="$pkgname-0.10-AUR"
package() {
  install -Dm755 "$srcdir/$pkgvera/bmplayer.sh" "$pkgdir/usr/bin/bmplayer"
  install -Dm755 "$srcdir/$pkgvera/bash-otube.sh" "$pkgdir/usr/bin/botube"
  install -Dm755 "$srcdir/$pkgvera/mplayer_config.sh" "$pkgdir/usr/bin/mplayer_config"
  install -Dm755 "$srcdir/$pkgvera/bash-player.svg" "$pkgdir/usr/share/pixmaps/bash-player.svg"
  install -Dm755 "$srcdir/$pkgvera/bash-otube.svg" "$pkgdir/usr/share/pixmaps/bash-otube.svg"
  install -Dm755 "$srcdir/$pkgvera/bash-player.desktop" "$pkgdir/usr/share/applications/bash-player.desktop"
  install -Dm755 "$srcdir/$pkgvera/bash-otube.desktop" "$pkgdir/usr/share/applications/bash-otube.desktop"
}

