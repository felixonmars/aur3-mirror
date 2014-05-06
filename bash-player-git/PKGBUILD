# Maintainer: Levi (levi0x0)
pkgname=bash-player-git
pkgver=20140505
pkgrel=1
pkgdesc="A simple GUI for Mplayer/MPV"
url="https://github.com/levi0x0/bash-player"
license=("GPL3")
arch=('any')
makedepends=('git')
depends=('zenity' 'mplayer')
#source=('git://github.com/levi0x0/bash-player.git')
source=('git+https://github.com/levi0x0/bash-player.git')
md5sums=('SKIP')

pkgver() {
    cd "bash-player"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  install -Dm755 "$srcdir/bash-player/bmplayer.sh" "$pkgdir/usr/bin/bmplayer"
  install -Dm755 "$srcdir/bash-player/bash-otube.sh" "$pkgdir/usr/bin/botube"
  install -Dm755 "$srcdir/bash-player/bash-player.svg" "$pkgdir/usr/share/pixmaps/bash-player.svg"
  install -Dm755 "$srcdir/bash-player/bash-otube.svg" "$pkgdir/usr/share/pixmaps/bash-otube.svg"
  install -Dm755 "$srcdir/bash-player/bash-player.desktop" "$pkgdir/usr/share/applications/bash-player.desktop"
  install -Dm755 "$srcdir/bash-player/bash-otube.desktop" "$pkgdir/usr/share/applications/bash-otube.desktop"
  install -Dm755 "$srcdir/bash-player/mplayer_config.sh" "$pkgdir/usr/bin/mplayer_config"
  echo "[!] DONE!  Run bmplayer/mplayer_config from the terminal or use your application menu."
}


