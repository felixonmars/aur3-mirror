# Maintainer: Zohar Malamant <youremail@domain.com>
pkgname=doom64ex-data
pkgver=1
pkgrel=1
pkgdesc="Creates data for Doom64 EX from an N64 rom."
arch=('any')
url='http://doomwiki.org/wiki/Doom_64'
license=('Custom')
depends=()
makedepends=('doom64ex-svn')
source=()
md5sums=()

build() {
  
  cd "$srcdir"

  rm -f doom64.wad doomsnd.sf2

  msg2 "Place the rom in the same directory as PKGBUILD"
  msg2 "The supported extensions are .n64 .z64 .c64"
  msg2 "-----------------------------------------------"

  for f in "$startdir"/*; do

    test -f "$f" || continue
 
    msg2 "Trying '$f'"
    doom64ex-wadgen "$f" > /dev/null && msg2 "Success!" && return 0
  done

  msg2 "-----------------------------------------------"
  msg2 "Couldn't find a compatible rom."

  return 1
}

package() {
  install -d "$pkgdir/usr/share/games/doom64"
  install -m644 "$startdir/doom64.wad" "$pkgdir/usr/share/games/doom64/DOOM64.WAD"
  install -m644 "$startdir/doomsnd.sf2" "$pkgdir/usr/share/games/doom64/DOOMSND.SF2"
}

# vim:set ts=2 sw=2 et:
