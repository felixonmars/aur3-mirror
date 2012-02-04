# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=fheroes2-data
pkgver=1
pkgrel=1
pkgdesc="Heroes 2 data files for fheroes2 (Requires Heroes 2 CD)"
arch=('any')
license=('unknown')
url="http://en.wikipedia.org/wiki/Heroes_of_Might_and_Magic_II"

build() {
  #local HEROES2_CD=${HEROES2_CD:=/media/cd}

  if test -z "$HEROES2_CD"; then
    error "Heroes 2 CD not found"
    echo "  You need to mount your Heroes 2 CD and"
    echo "  point HEROES2_CD to the mountpoint"
    echo
    return 1
  fi

  if ! test -e "$HEROES2_CD/HEROES2/DATA/HEROES2.AGG"; then
    error "Unable to find the HEROES2/DATA/HEROES2.AGG file on the CD."
    false
  fi

  install -Dm644 "$HEROES2_CD/HEROES2/DATA/HEROES2.AGG" "$pkgdir/usr/share/fheroes2/data/HEROES2.AGG"
  install -dm755 "$pkgdir/usr/share/fheroes2/maps"
  install -m644 "$HEROES2_CD/HEROES2/MAPS/"* "$pkgdir/usr/share/fheroes2/maps/"
}

# vim:set ts=2 sw=2 et:
