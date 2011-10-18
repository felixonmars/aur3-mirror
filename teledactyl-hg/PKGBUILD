# Maintainer: Christofer Odén <bei.oden@gmail.com>

pkgname=teledactyl-hg
_basename=teledactyl
pkgver=0.6
pkgrel=1
pkgdesc="Teledactyl is a fork of Muttator, an add-on for the Thunderbird mail client, which makes it look and behave like the Vim text editor."
arch=('any')
url="http://dactyl.sourceforge.net/teledactyl"
license=('MIT')
depends=('thunderbird>=3.5')
makedepends=('mercurial')

_hgroot="https://dactyl.googlecode.com/hg/"
_hgrepo="dactyl"

fetch() {
  cd $srcdir
  pwd

  if [ -d ${_hgrepo} ]; then
    msg "Updating from repo..."
    cd $srcdir/${_hgrepo}
    pwd
    hg pull -u
    hg update
  else
    msg "Pulling repo..."
    hg clone ${_hgroot}${_hgrepo} || return 1
    cd $srcdir/${_hgrepo}
    pwd
    hg update
  fi

  msg "Mercurial checkout done"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -R "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
}

build() {
  fetch

  cd "$srcdir/$_hgrepo-build"
  pwd
  make -C teledactyl xpi || return 1
}

package() {
  cd "$srcdir/$_hgrepo-build/teledactyl"
  pwd
  local _emid=$(awk 'BEGIN {FS="[\"]"}; /em:id/ {print $2; exit}' install.rdf)
  local _tbver=$(thunderbird -v | cut -d' ' -f3)
  local dstdir="$pkgdir/usr/lib/thunderbird-$_tbver/extensions/$_emid"

  install -d "$dstdir"
  cd "$srcdir/$_hgrepo-build/downloads/"
  bsdtar -xf teledactyl-$pkgver.xpi
  rm $_basename-$pkgver.xpi
  cp -R * "$dstdir"
}

# vim:set ts=2 sw=2 et:
