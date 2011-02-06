# Maintainer roughl <r0ugh_l at yahoo dot de>

pkgname=moon-buggy-highscore
pkgver=1.0
pkgrel=2
pkgdesc="Support for a global moon-buggy highscore file"
arch=(any)
license=('GPL')
depends=('moon-buggy')
conflicts=()
url="http://seehuhn.de/comp/moon-buggy"

build() {
  mkdir -p "$startdir/pkg/usr/com/moon-buggy/"
  if [ -f ~/.mbscore ]; then
    install -g root -o root -m 666 ~/.mbscore "$startdir/pkg/usr/com/moon-buggy/mbscore"
  else
    touch "$startdir/pkg/usr/com/moon-buggy/mbscore"
    chown root:root "$startdir/pkg/usr/com/moon-buggy/mbscore"
    chmod 666 "$startdir/pkg/usr/com/moon-buggy/mbscore" 
  fi
}

