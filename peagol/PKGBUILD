# Maintainer: Sam Harada <peasantoid at archlinux dot us>

pkgname=peagol
pkgver=20100214
pkgrel=1
pkgdesc="C implementation of Conway's Game of Life"
arch=(i686 x86_64)
url="http://peasantoid.org/git/peagol"
license=(BSD)
depends=(sdl sdl_gfx)
makedepends=(git)

build() {
  cd $srcdir
  if test -d peagol; then
    cd peagol
    git pull || return 1
  else
    git clone git://peasantoid.org/peagol || return 1
    cd peagol
  fi
  inst_root=$pkgdir ./make quick || return 1
}
